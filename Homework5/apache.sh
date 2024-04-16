

#!/bin/bash
sudo yum update
sudo yum install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2