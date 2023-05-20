resource "aws_security_group" "nat_sec_grp" {
  name        = "nat-sec-grp"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.demo_vpc.id
    
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_block]
    self        = true
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }     
  
}

resource "aws_security_group" "nodes_sg" {
    name        = "nodes-sg"
    description = "Allow inbound traffic from nat instance"
    vpc_id      = aws_vpc.demo_vpc.id
        
    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        self        = true
    }
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        security_groups = [aws_security_group.nat_sec_grp.id]

    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}