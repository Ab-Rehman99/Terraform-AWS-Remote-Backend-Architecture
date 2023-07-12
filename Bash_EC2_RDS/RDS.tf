 resource "aws_db_instance" "my_rds" {
   allocated_storage   =  5
   storage_type        = "gp2"
   identifier          = "mysql-rds-terraform"
   engine              = "mysql"
   engine_version      = "5.7"
   instance_class      = "db.t3.micro"
   username            = "admin"  # change the user name 
   password            = "Reddeadredemption2"  # change the password 
   publicly_accessible = true
   skip_final_snapshot = true

   tags = {
     Name = "my_rds"
   }
 }
# output "public_ip" {
#   value = aws_instance.php-server.public_ip
# }

output "db_instance_addr" {
  value = aws_db_instance.my_rds.address
}