# Projeto de E-commerce na Nuvem

## Cenário
TechStore - Loja online de produtos eletrônicos

## Modelo de Serviço Escolhido
Utilizamos principalmente PaaS (Platform as a Service) com componentes serverless:
- **Elastic Beanstalk** para hospedar o site (PaaS)
- **RDS** para o banco de dados (PaaS)
- **Lambda** para processamento de pagamentos (Serverless)

## Justificativa da Escolha
- PaaS permite foco no desenvolvimento sem gerenciar servidores
- Reduz custos operacionais e tempo de manutenção
- Escalabilidade automática durante períodos de alta demanda

## Pipeline CI/CD
Utilizamos GitHub Actions para automatizar:
1. Testes da aplicação
2. Provisionamento da infraestrutura via Terraform
3. Implantação do código

## Diagrama da Arquitetura
