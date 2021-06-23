local_init:
	sudo apt-get install curl
	curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
	sudo apt-get install nodejs
	sudo npm install -g aws-cdk