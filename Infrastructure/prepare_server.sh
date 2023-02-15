#!/bin/bash

ssh -t -i ~/Downloads/DemoServer_key.pem azureuser@20.93.19.9 'wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb'
ssh -t -i ~/Downloads/DemoServer_key.pem azureuser@20.93.19.9 'sudo dpkg -i packages-microsoft-prod.deb'
ssh -t -i ~/Downloads/DemoServer_key.pem azureuser@20.93.19.9 'rm packages-microsoft-prod.deb'

ssh -t -i ~/Downloads/DemoServer_key.pem azureuser@20.93.19.9 'sudo apt-get update'
ssh -t -i ~/Downloads/DemoServer_key.pem azureuser@20.93.19.9 'sudo apt-get install -y aspnetcore-runtime-6.0'

scp -r -i ~/Downloads/DemoServer_key.pem '/Users/lasse/Development/CLO22 Development/MyFirstApp123/Infrastructure/MyFirstApp123.service' azureuser@20.93.19.9:/tmp/MyFirstApp123.service
ssh -t -i ~/Downloads/DemoServer_key.pem azureuser@20.93.19.9 'sudo cp /tmp/MyFirstApp123.service /etc/systemd/system/MyFirstApp123.service'

ssh -t -i ~/Downloads/DemoServer_key.pem azureuser@20.93.19.9 'sudo systemctl daemon-reload'
#ssh -t -i ~/Downloads/DemoServer_key.pem azureuser@20.93.19.9 'sudo systemctl start MyFirstApp123.service'