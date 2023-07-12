resource "aws_instance" "php-server" {
  ami           = "ami-053b0d53c279acc90" # This is a ami having php 8.1 and other modules already installed
  instance_type = "t2.micro"             # replace with your desired instance type
#   key_name      = "php-web-keyPair"                # replace with your EC2 key name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install apache2 php libapache2-mod-php -y
              echo "well done abdul" | sudo tee /var/www/html/index.php
              sudo mv /var/www/html/index.html /var/www/html/index.html.temp
              sudo systemctl restart apache2
              EOF

  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  
  tags = {
    Name = "php-server"
  }
}

output "public_ip" {
  value = aws_instance.php-server.public_ip
}