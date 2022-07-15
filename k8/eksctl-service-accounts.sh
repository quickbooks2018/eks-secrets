#!/bin/bash
set -x

# Update Me
export CLUSTER_NAME="cloudgeeks-eks-dev"
export AWS_DEFAULT_REGION="us-east-1"
export SERVICE_ACCOUNT_NAME="cloudgeeks-secrets"
export POLICY_NAME="cloudgeeks-secret-dev-policy"
export NAMESPACE="asim"

namespaceStatus=$(kubectl get ns $NAMESPACE -o json | jq .status.phase -r)

if [ $namespaceStatus == "Active" ]
then
    echo "namespace is present"
else
   echo "namespace is not present"
   kubectl create ns ${NAMESPACE}
fi

export MY_AWS_ACCOUNT_ID="$(aws sts get-caller-identity --query Account --output text)"
export VPC_ID=$(aws eks describe-cluster --name ${CLUSTER_NAME} --region $AWS_DEFAULT_REGION --output json | jq -r .cluster.resourcesVpcCo
nfig.vpcId)

#export VPC_ID=$(aws eks describe-cluster --name ${CLUSTER_NAME} --region $AWS_DEFAULT_REGION | awk '{print $5}' | grep -i vpc)


# Download IAM Policy
## Download latest
# curl -o ${POLICY_NAME}.json https://raw.githubusercontent.com/kubernetes-sigs/${SERVICE_ACCOUNT_NAME}/main/docs/install/iam_policy.json

# Create a policy
cat <<EOF > ${POLICY_NAME}.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "secretsmanager:*",
                "cloudformation:DescribeChangeSet",
                "cloudformation:DescribeStackResource",
                "cloudformation:DescribeStacks",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcs",
                "kms:DescribeKey",
                "kms:ListAliases",
                "kms:ListKeys",
                "lambda:ListFunctions",
                "rds:DescribeDBClusters",
                "rds:DescribeDBInstances",
                "redshift:DescribeClusters",
                "tag:GetResources"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "lambda:AddPermission",
                "lambda:CreateFunction",
                "lambda:GetFunction",
                "lambda:InvokeFunction",
                "lambda:UpdateFunctionConfiguration"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:lambda:*:*:function:SecretsManager*"
        },
        {
            "Action": [
                "serverlessrepo:CreateCloudFormationChangeSet",
                "serverlessrepo:GetApplication"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:serverlessrepo:*:*:applications/SecretsManager*"
        },
        {
            "Action": [
                "s3:GetObject"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::awsserverlessrepo-changesets*",
                "arn:aws:s3:::secrets-manager-rotation-apps-*/*"
            ]
        }
    ]
}
EOF

# Create IAM Policy using policy downloaded
aws iam create-policy \
    --policy-name ${POLICY_NAME} \
    --policy-document file://${POLICY_NAME}.json

# OIDC Creation
aws eks describe-cluster --name ${CLUSTER_NAME} --query "cluster.identity.oidc.issuer" --output text  

eksctl utils associate-iam-oidc-provider --cluster ${CLUSTER_NAME} --approve


eksctl create iamserviceaccount \
    --region ${AWS_DEFAULT_REGION} \
    --name ${SERVICE_ACCOUNT_NAME} \
    --namespace ${NAMESPACE} \
    --cluster ${CLUSTER_NAME} \
    --attach-policy-arn arn:aws:iam::${MY_AWS_ACCOUNT_ID}:policy/${POLICY_NAME} \
    --override-existing-serviceaccounts \
    --approve

# Get IAM Service Account
eksctl get iamserviceaccount --cluster ${CLUSTER_NAME}

# Describe Service Account ${SERVICE_ACCOUNT_NAME}
kubectl describe sa ${SERVICE_ACCOUNT_NAME} -n ${NAMESPACE}

#################################
# Serive Account Usage with Helm
#################################

# Serive Account Usage with Helm, Example Install the AWS Load Balancer Controller.

# Add the eks-charts repository.
# helm repo add eks https://aws.github.io/eks-charts

# Update your local repo to make sure that you have the most recent charts.
# helm repo update

# Install the AWS Load Balancer Controller.
# Helm Template
# export AWS_ACCOUNT_ID="602401143452" # aws ecr account

# helm upgrade --install ${SERVICE_ACCOUNT_NAME} eks/${SERVICE_ACCOUNT_NAME} \
#   -n ${NAMESPACE} \
#   --set clusterName=${CLUSTER_NAME} \
#   --set serviceAccount.create=false \
#   --set serviceAccount.name=${SERVICE_ACCOUNT_NAME} \
#   --set region=${AWS_DEFAULT_REGION} \
#   --set vpcId=${VPC_ID} \
#   --set image.repository=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/amazon/${SERVICE_ACCOUNT_NAME}


# END