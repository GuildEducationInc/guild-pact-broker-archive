deploy.dev:
	@echo "Deploying to dev"
	@aws cloudformation deploy --template-file template.yml --profile guild-dev --stack-name guild-pact-broker-dev