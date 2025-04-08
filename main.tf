provider "aws" {
  region = "us-east-1"
}

# Aplicação web (usando Elastic Beanstalk - PaaS)
resource "aws_elastic_beanstalk_application" "app" {
  name        = "techstore-app"
  description = "Aplicação da loja TechStore"
}

resource "aws_elastic_beanstalk_environment" "env" {
  name                = "techstore-env"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2 v5.5.0 running Node.js 14"
}

# Banco de dados
resource "aws_db_instance" "db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  name                 = "techstore_db"
  username             = "admin"
  password             = "password123"  # Em produção, use variáveis seguras!
  skip_final_snapshot  = true
}

# Função Lambda (serverless) para processamento de pagamentos
resource "aws_lambda_function" "payment" {
  filename      = "payment.zip"
  function_name = "payment_processor"
  role          = "arn:aws:iam::123456789012:role/lambda-role"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
}
