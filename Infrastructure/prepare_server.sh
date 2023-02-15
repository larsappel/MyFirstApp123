#!/bin/bash

chmod 400 $KEY

ssh -t -i $KEY $USR@$IP 'wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb'
ssh -t -i $KEY $USR@$IP 'sudo dpkg -i packages-microsoft-prod.deb'
ssh -t -i $KEY $USR@$IP 'rm packages-microsoft-prod.deb'

#az login
az vm open-port --resource-group $RESOURCE_GRP --name $SERVER_NAME --port $PORT

ssh -t -i $KEY $USR@$IP 'sudo apt-get update'
ssh -t -i $KEY $USR@$IP 'sudo apt-get install -y aspnetcore-runtime-6.0'

scp -r -i $KEY "$(pwd)/app.service" $USR@$IP:/tmp/$APP_NAME.service
ssh -t -i $KEY $USR@$IP "sudo cp /tmp/$APP_NAME.service /etc/systemd/system/$APP_NAME.service"

ssh -t -i $KEY $USR@$IP 'sudo systemctl daemon-reload'