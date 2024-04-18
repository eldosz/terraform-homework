#!/bin/bash
sudo apt update
sudo apt install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
