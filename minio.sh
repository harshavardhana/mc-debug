#!/bin/bash

sudo wget https://dl.min.io/server/minio/release/linux-amd64/minio
sudo chmod +x minio
sudo mkdir ./data
sudo chown -R circleci ./data
sudo chmod u+rxw ./data
./minio server ./data --address=:3000 &

sleep 2

sudo wget https://dl.min.io/client/mc/release/linux-amd64/mc
sudo chmod +x mc

./mc config host add minio http://127.0.0.1:3000 minioadmin minioadmin
./mc mb minio/test1
./mc mb minio/test2
