#!/bin/bash

ssh -t -i ~/Downloads/DemoServer_key.pem azureuser@20.93.19.9 'sudo systemctl stop myapp.service'
ssh -t -i ~/Downloads/DemoServer_key.pem azureuser@20.93.19.9 'rm -R ~/MyApp'
scp -r -i ~/Downloads/DemoServer_key.pem '/Users/lasse/Development/CLO22 Development/MyFirstApp123/bin/Debug/net6.0/publish' azureuser@20.93.19.9:~/MyApp
ssh -t -i ~/Downloads/DemoServer_key.pem azureuser@20.93.19.9 'sudo systemctl start myapp.service'