provider "aws" {
  region = "eu-west-1"
}

resource "aws_security_group" "minecraft_sg" {
  name        = "minecraft-sg"
  description = "Allow Minecraft and SSH access"
<<<<<<< HEAD
  vpc_id      = "vpc-0e6833a46b3dd57cc"  # 	TESTTEST
=======
  vpc_id      = "vpc-0e6833a46b3dd57cc" 
>>>>>>> e09e954f1f907ce5dfe6f1ed06e6e3536b92f0f7

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
<<<<<<< HEAD
  }
=======
>>>>>>> e09e954f1f907ce5dfe6f1ed06e6e3536b92f0f7

  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "minecraft_server" {
<<<<<<< HEAD
  ami                    = "ami-0dc0ac921efee9f9d"  
  instance_type          = "t2.micro"              
=======
  ami                    = "ami-0dc0ac921efee9f9d" 
  instance_type          = "t2.micro"               
>>>>>>> e09e954f1f907ce5dfe6f1ed06e6e3536b92f0f7
  key_name               = "test"
  vpc_security_group_ids = [aws_security_group.minecraft_sg.id]

  tags = {
    Name = "TerraformMinecraft"
  }

  user_data = <<-EOF
              #!/bin/bash
              set -e
              exec > /var/log/user-data.log 2>&1

              apt update
              apt install -y openjdk-21-jre-headless screen wget curl

              mkdir -p /home/ubuntu/minecraft
              cd /home/ubuntu/minecraft

              wget https://api.papermc.io/v2/projects/paper/versions/1.21.1/builds/49/downloads/paper-1.21.1-49.jar -O paper.jar

              echo "eula=true" > eula.txt

              chown -R ubuntu:ubuntu /home/ubuntu/minecraft

<<<<<<< HEAD
=======
             
>>>>>>> e09e954f1f907ce5dfe6f1ed06e6e3536b92f0f7
              sudo -u ubuntu screen -dmS minecraft bash -c 'cd /home/ubuntu/minecraft && java -Xmx800M -Xms800M -jar paper.jar nogui'
              EOF
}

output "minecraft_server_public_ip" {
  value = aws_instance.minecraft_server.public_ip
}
