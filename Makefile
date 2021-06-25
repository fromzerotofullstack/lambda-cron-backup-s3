local_init:
	# sudo apt-get -y install make
	sudo apt-get install curl
	curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
	sudo apt-get install nodejs
	sudo npm install -g aws-cdk
	cd cron_backup_s3; cdk init --language typescript
local_install_deps:
	cd cron_backup_s3; sudo npm install @aws-cdk/aws-s3