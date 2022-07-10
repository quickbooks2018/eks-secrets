export WORDPRESS_DATABASE_HOST=$(aws secretsmanager get-secret-value --secret-id wordpress --region us-east-1 --query SecretString --output text | jq -r '."WORDPRESS_DATABASE_HOST"')
export WORDPRESS_DATABASE_USER=$(aws secretsmanager get-secret-value --secret-id wordpress --region us-east-1 --query SecretString --output text | jq -r '."WORDPRESS_DATABASE_USER"')
export WORDPRESS_DATABASE_PASSWORD=$(aws secretsmanager get-secret-value --secret-id wordpress --region us-east-1 --query SecretString --output text | jq -r '."WORDPRESS_DATABASE_PASSWORD"')
export WORDPRESS_DATABASE_PORT_NUMBER=$(aws secretsmanager get-secret-value --secret-id wordpress --region us-east-1 --query SecretString --output text | jq -r '."WORDPRESS_DATABASE_PORT_NUMBER"')
export WORDPRESS_DATABASE_NAME=mysql

echo $WORDPRESS_DATABASE_HOST > wordpress.txt
echo $WORDPRESS_DATABASE_USER >> wordpress.txt
echo $WORDPRESS_DATABASE_PASSWORD >> wordpress.txt
echo $WORDPRESS_DATABASE_NAME >> wordpress.txt
echo $WORDPRESS_DATABASE_PORT_NUMBER >> wordpress.txt