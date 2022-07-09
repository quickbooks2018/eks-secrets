export WORDPRESS_DB_HOST=$(aws secretsmanager get-secret-value --secret-id wordpress --region us-east-1 --query SecretString --output text | jq -r '."WORDPRESS_DB_HOST"')
export WORDPRESS_DB_USER=$(aws secretsmanager get-secret-value --secret-id wordpress --region us-east-1 --query SecretString --output text | jq -r '."WORDPRESS_DB_USER"')
export WORDPRESS_DB_PASSWORD=$(aws secretsmanager get-secret-value --secret-id wordpress --region us-east-1 --query SecretString --output text | jq -r '."WORDPRESS_DB_PASSWORD"')
export WORDPRESS_DB_NAME=mysql