#!/bin/bash
ENV=$1
if [[ -z "$ENV" ]] ; then
	echo "Environment should be set on startup with one of the below values"
	echo "ENV must be one of - DEV, QA, PROD or LOCAL"
	exit
fi

echo "$ENV before case conversion"
AWS_REGION=$(eval "echo \$${ENV}_AWS_REGION")
AWS_ACCESS_KEY_ID=$(eval "echo \$${ENV}_AWS_ACCESS_KEY_ID")
AWS_SECRET_ACCESS_KEY=$(eval "echo \$${ENV}_AWS_SECRET_ACCESS_KEY")
AWS_ACCOUNT_ID=$(eval "echo \$${ENV}_AWS_ACCOUNT_ID")
AWS_REPOSITORY=$(eval "echo \$${ENV}_AWS_REPOSITORY")
#APP_NAME

#Converting environment varibale as lower case for build purpose
#ENV=`echo "$ENV" | tr '[:upper:]' '[:lower:]'`
#echo "$ENV after case conversion"

configure_aws_cli() {
	aws --version
	aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
	aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
	aws configure set default.region $AWS_REGION
	aws configure set default.output json
	echo "Configured AWS CLI."
}


configure_aws_cli
eval $(aws ecr get-login  --region $AWS_REGION)
# Builds Docker image of the app.
TAG=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$AWS_REPOSITORY:$CIRCLE_SHA1
docker build -t $TAG .
