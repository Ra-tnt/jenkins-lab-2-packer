#!/bin/bash
# Install docker
<<<<<<< HEAD
sudo apt update -y && sudo apt install -y docker.io
=======
curl -Ls get.docker.com | sh
>>>>>>> upstream/k8s
sudo usermod -aG docker ubuntu

# Create directory to be served
sudo mkdir -p /home/ubuntu/api
sudo chmod a+rwx /home/ubuntu/api
sudo chown ubuntu:ubuntu /home/ubuntu/api

# Configure nginx container to boot with the machine
sudo touch /etc/systemd/system/webserver.service
sudo chmod a+rw /etc/systemd/system/webserver.service
cat <<EOF > /etc/systemd/system/webserver.service
[Unit]
Description=Nginx API address server
After=docker.service
<<<<<<< HEAD
[Service]
Type=simple
ExecStart=sudo docker container run -d --name nginx -p 80:80 --restart=always -v /home/ubuntu/api/:/usr/share/nginx/html:ro nginx
=======

[Service]
Type=simple
ExecStart=sudo docker container run -d --name nginx -p 80:80 --restart=always -v /home/ubuntu/api/:/usr/share/nginx/html:ro nginx

>>>>>>> upstream/k8s
[Install]
WantedBy=multi-user.target
EOF
sudo chmod a-xw /etc/systemd/system/webserver.service
sudo systemctl daemon-reload
sudo systemctl enable webserver
sudo systemctl start webserver
