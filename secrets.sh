export USERNAME=$(aws secretsmanager get-secret-value --secret-id secrets --region us-east-1 --query SecretString --output text | jq -r '."USERNAME"')

export PASSWORD=$(aws secretsmanager get-secret-value --secret-id secrets --region us-east-1 --query SecretString --output text | jq -r '."PASSWORD"')

echo USERNAME=$USERNAME > /secrets

echo PASSWORD=$PASSWORD >> /secrets