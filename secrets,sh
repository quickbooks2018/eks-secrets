USERNAME=$(aws secretsmanager get-secret-value --secret-id secrets --region us-east-1 --query SecretString --output text | jq -r '."USERNAME"')

PASSWORD=$(aws secretsmanager get-secret-value --secret-id secrets --region us-east-1 --query SecretString --output text | jq -r '."PASSWORD"')