#!/bin/bash

# IP='20.93.21.43'
# USR='azureuser'
# KEY='~/Downloads/DemoServer_key.pem'
# TARGET_DIR='~/MyApp'

az login
az vm open-port --resource-group $RESOURCE_GRP --name $SERVER_NAME --port $PORT

ssh -t -i $KEY $USR@$IP 'wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb'
ssh -t -i $KEY $USR@$IP 'sudo dpkg -i packages-microsoft-prod.deb'
ssh -t -i $KEY $USR@$IP 'rm packages-microsoft-prod.deb'

ssh -t -i $KEY $USR@$IP 'sudo apt-get update'
ssh -t -i $KEY $USR@$IP 'sudo apt-get install -y aspnetcore-runtime-6.0'

scp -r -i $KEY '/Users/lasse/Development/CLO22 Development/MyFirstApp123/Infrastructure/MyFirstApp123.service' $USR@$IP:/tmp/MyFirstApp123.service
ssh -t -i $KEY $USR@$IP 'sudo cp /tmp/MyFirstApp123.service /etc/systemd/system/MyFirstApp123.service'

ssh -t -i $KEY $USR@$IP 'sudo systemctl daemon-reload'