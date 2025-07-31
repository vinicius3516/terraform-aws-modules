# Módulos Terraform para AWS

Este repositório contém uma coleção de módulos Terraform reutilizáveis para provisionar vários recursos na Amazon Web Services (AWS). Cada módulo é projetado para ser autônomo e facilmente integrado em diferentes projetos Terraform, promovendo a reutilização de código e as melhores práticas de IaC (Infrastructure as Code).

## Pré-requisitos

Antes de utilizar estes módulos, garanta que você tenha:

-   **Terraform** instalado (versão 1.0.0 ou superior).
-   Uma **Conta AWS** ativa.
-   **AWS CLI** configurado com as credenciais apropriadas.

## Módulos Disponíveis

Abaixo está a lista de módulos atualmente disponíveis neste repositório. Para adicionar um novo módulo, crie um novo diretório em `modules/` e atualize esta tabela.

| Módulo | Descrição |
| :--- | :--- |
| `alb` | Provisiona um Application Load Balancer (ALB), com listeners e target groups. |
| `asg` | Cria um Auto Scaling Group para instâncias EC2, garantindo escalabilidade e resiliência. |
| `sg` | Define e gerencia Security Groups para controlar o tráfego de entrada e saída. |
| `vpc` | Cria uma Virtual Private Cloud (VPC) completa, com sub-redes, tabelas de rotas e gateways. |

## Como Usar

Para utilizar um módulo em seu projeto Terraform, adicione um bloco `module` ao seu código, apontando para o diretório do módulo desejado. Lembre-se, sempre confira as variaveis requeridas por cada modulo.

**Exemplo: Utilizando o módulo VPC**

```hcl
# VPC
module "vpc" {
  source               = "git::https://github.com/vinicius3516/terraform-aws-modules.git//modules/vpc?ref=main"
  vpc_cidr_block       = var.vpc_cidr_block
  environment          = var.environment
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}
```
