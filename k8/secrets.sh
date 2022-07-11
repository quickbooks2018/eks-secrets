export NGINX_SECRET_KEY_BASE=$(aws secretsmanager get-secret-value --secret-id nginx --region us-east-1 --query SecretString --output text | jq -r '."NGINX_SECRET_KEY_BASE"')
export NGINX_DB_USERNAME=$(aws secretsmanager get-secret-value --secret-id nginx --region us-east-1 --query SecretString --output text | jq -r '."NGINX_DB_USERNAME"')
export NGINX_DB_PASSWORD=$(aws secretsmanager get-secret-value --secret-id nginx --region us-east-1 --query SecretString --output text | jq -r '."NGINX_DB_PASSWORD"')
export NGINX_DB_MYSQL=$(aws secretsmanager get-secret-value --secret-id nginx --region us-east-1 --query SecretString --output text | jq -r '."NGINX_DB_MYSQL"')

echo NGINX_SECRET_KEY_BASE=$NGINX_SECRET_KEY_BASE > /secrets.env
echo NGINX_DB_USERNAME=$NGINX_DB_USERNAME >> /secrets.env
echo NGINX_DB_PASSWORD=$NGINX_DB_PASSWORD >> /secrets.env
echo NGINX_DB_MYSQL=$NGINX_DB_MYSQL >> /secrets.env