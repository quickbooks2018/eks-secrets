export REDMINE_SECRET_KEY_BASE=$(aws secretsmanager get-secret-value --secret-id redmine --region us-east-1 --query SecretString --output text | jq -r '."REDMINE_SECRET_KEY_BASE"')
export REDMINE_DB_USERNAME=$(aws secretsmanager get-secret-value --secret-id redmine --region us-east-1 --query SecretString --output text | jq -r '."REDMINE_DB_USERNAME"')
export REDMINE_DB_PASSWORD=$(aws secretsmanager get-secret-value --secret-id redmine --region us-east-1 --query SecretString --output text | jq -r '."REDMINE_DB_PASSWORD"')
export REDMINE_DB_MYSQL=$(aws secretsmanager get-secret-value --secret-id redmine --region us-east-1 --query SecretString --output text | jq -r '."REDMINE_DB_MYSQL"')
export REDMINE_DB_DATABASE==$(aws secretsmanager get-secret-value --secret-id redmine --region us-east-1 --query SecretString --output text | jq -r '."REDMINE_DB_DATABASE"')

echo REDMINE_SECRET_KEY_BASE=$REDMINE_SECRET_KEY_BASE > /secrets
echo REDMINE_DB_USERNAME=$REDMINE_DB_USERNAME >> /secrets
echo REDMINE_DB_PASSWORD=$REDMINE_DB_PASSWORD >> /secrets
echo REDMINE_DB_MYSQL=$REDMINE_DB_MYSQL >> /secrets
echo REDMINE_DB_DATABASE=$REDMINE_DB_DATABASE >> /secrets