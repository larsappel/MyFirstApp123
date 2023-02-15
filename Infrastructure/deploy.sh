#!/bin/bash

# IP='20.93.21.43'
# USR='azureuser'
# KEY='~/Downloads/DemoServer_key.pem'
# TARGET_DIR='~/MyApp'

ssh -t -i $KEY $USR@$IP "sudo systemctl stop $APP_NAME.service"
ssh -t -i $KEY $USR@$IP "rm -R $TARGET_DIR"
scp -r -i $KEY '/Users/lasse/Development/CLO22 Development/MyFirstApp123/bin/Debug/net6.0/publish' $USR@$IP:$TARGET_DIR
ssh -t -i $KEY $USR@$IP "sudo systemctl start $APP_NAME.service"