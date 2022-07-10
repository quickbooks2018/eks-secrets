export WORDPRESS_DATABASE_HOST=$(aws secretsmanager get-secret-value --secret-id wordpress --region us-east-1 --query SecretString --output text | jq -r '."WORDPRESS_DATABASE_HOST"')
export WORDPRESS_DATABASE_USER=$(aws secretsmanager get-secret-value --secret-id wordpress --region us-east-1 --query SecretString --output text | jq -r '."WORDPRESS_DATABASE_USER"')
export WORDPRESS_DATABASE_PASSWORD=$(aws secretsmanager get-secret-value --secret-id wordpress --region us-east-1 --query SecretString --output text | jq -r '."WORDPRESS_DATABASE_PASSWORD"')
export WORDPRESS_DATABASE_PORT_NUMBER=$(aws secretsmanager get-secret-value --secret-id wordpress --region us-east-1 --query SecretString --output text | jq -r '."WORDPRESS_DATABASE_PORT_NUMBER"')
export WORDPRESS_DATABASE_NAME=mysql
export NGINX_HTTP_PORT_NUMBER=8080
export NGINX_HTTPS_PORT_NUMBER=443


echo $WORDPRESS_DATABASE_HOST > /etc/environment
echo $WORDPRESS_DATABASE_USER >> /etc/environment
echo $WORDPRESS_DATABASE_PASSWORD >> /etc/environment
echo $WORDPRESS_DATABASE_NAME >> /etc/environment
echo $WORDPRESS_DATABASE_PORT_NUMBER >> /etc/environment
echo $NGINX_HTTP_PORT_NUMBER >> /etc/environment
echo $NGINX_HTTPS_PORT_NUMBER >> /etc/environment