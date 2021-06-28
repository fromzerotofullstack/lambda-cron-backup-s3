.PHONY: local_init local_install_deps deploy destroy

local_init:
	# sudo apt-get -y install make
	sudo apt-get install curl
	curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
	sudo apt-get install nodejs
	sudo npm install -g aws-cdk
	cd cron_backup_s3; cdk init --language typescript
local_install_deps:
	cd cron_backup_s3; sudo npm install @aws-cdk/aws-s3
	cd cron_backup_s3; sudo npm install @aws-cdk/aws-lambda
	cd cron_backup_s3; sudo npm install @mobileposse/auto-delete-bucket
	cd cron_backup_s3; sudo npm install @aws-cdk/aws-cloudformation

deploy:
	# we need these permissions
	#	IAMFullAccess
	#	AWS managed policy
	#	AmazonS3FullAccess
	#	AWS managed policy
	#	AmazonAPIGatewayAdministrator
	#	AWS managed policy
	#	AWSCloudFormationFullAccess
	#	AWS managed policy
	#	AWSLambda_FullAccess
	#   CloudWatchEventsFullAccess

	cd cron_backup_s3; cdk --profile cron_backup_s3 bootstrap --tolkit-bucket-name "cdktoolkit-stagingbucket-1nqbzxnpb4osg"
	# profile depends on ~/.aws/credentials config file section

	# without asking for confirmation
	#cd cron_backup_s3; cdk --profile cron_backup_s3 deploy --require-approval never
	cd cron_backup_s3; cdk --profile cron_backup_s3 deploy
destroy:
	cd cron_backup_s3; cdk --profile cron_backup_s3 destroy --force
