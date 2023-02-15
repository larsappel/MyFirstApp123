#!/bin/bash

dotnet publish ../

DIR=$(dirname "$(pwd)")'/bin/Debug/net6.0/publish'

ssh -t -i $KEY $USR@$IP "sudo systemctl stop $APP_NAME.service"
ssh -t -i $KEY $USR@$IP "sudo rm -R /tmp/$APP_NAME"
scp -r -i $KEY "$DIR" $USR@$IP:/tmp/$APP_NAME
ssh -t -i $KEY $USR@$IP "sudo rm -R $TARGET_DIR"
ssh -t -i $KEY $USR@$IP "sudo cp -r /tmp/$APP_NAME/ $TARGET_DIR"
ssh -t -i $KEY $USR@$IP "sudo systemctl start $APP_NAME.service"