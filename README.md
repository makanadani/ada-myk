﻿*AUTORA: Marina Yumi Kanadani*

*ROTEIRO: [*Projeto*](./projeto_modulo.md)*

## Ada | Embarque TI | Serviços para Desenvolvedores

# DESAFIO
## Deploy de Infraestrutura para Aplicação em Kubernetes com Terraform 

### Introdução
Este documento descreve a infraestrutura implementada utilizando **Terraform** para provisionamento de recursos no **Microsoft Azure** e **Kubernetes** para a implantação de uma aplicação conteinerizada. 

### Infraestrutura
A infraestrutura está organizada em diversos arquivos visando implementação via Terraform:

1. **Ambiente**
- `application.spd`: Arquivos e diretórios necessários para construir, configurar e executar a **aplicação**.
- `ada-azure-project-2025-01.sln`: Arquivo de solução do **Microsoft Visual Studio** para compilação da aplicação.
- `aks.tf`: Provisiona o cluster **Azure Kubernetes Service (AKS)**, incluindo **namespace** dedicado à aplicação.
- `application.spd-dockerfile`: **Dockerfile** para criar a imagem da aplicação.
- `deployment.tf`: Define a **implantacão (Deployment)** da aplicação no Kubernetes.
- `ingress.tf`: Configura o **Ingress** para exposição externa da aplicação.
- `network.tf`: Define a **Virtual Network (VNet)** e **Subnet**.
- `resource-group.tf`: Cria o **Resource Group** onde todos os recursos serão implantados.
- `providers.tf`: Configura os **provedores** Terraform.
- `service-account.tf`: Cria uma **Service Account** para autenticação no Kubernetes.
- `service.tf`: Define o **Service** no Kubernetes para expor a aplicação internamente.
- `variables.tf`: Define variáveis reutilizáveis no Terraform. 

2. **Azure Key Vault**
- `keyvault.tf`: Provisiona o **Azure Key Vault** para armazenar segredos de forma segura.
- `keyvault-secret.tf`: Adiciona **secrets** no **Key Vault**.
- `managed-identity.tf`: Cria uma **Managed Identity** para a aplicação acessar recursos sem credenciais explícitas, incluindo permissões necessárias para acesso aos recursos.
- `secrets.auto.tfvars`: Armazena valores sensíveis como senhas e segredos.

3. **Banco de Dados**
- `database.tf`: Cria o **Azure SQL Server** e o **banco de dados**.
- `firewall.tf`: Configurações de **firewall** para proteger o **SQL Server**.

### Deployment da Aplicação
- A variavel de ambiente SPD_KEY_VAULT_URI deve conter a Uri do key vault. Ex: `https://mykeyvault.vault.azure.net/`
- Container image: `schwendler/embarque-ti-spd-project`
- A secret com a connection string deve ser definida com o nome: `db-connection-string`
- O pod da aplicação deve recuperar automaticamente a string de conexão do Key Vault.
- Aplicação irá rodar na porta 8080
- Banco de dados esperado: Microsoft SQL Server

### Modo de Uso

### 1.1 **Inicialização do Terraform**
Antes de aplicar as configurações, execute o seguinte comando para inicializar os provedores Terraform:

```sh
terraform init
```

### 1.2 **Visualizar o Plano de Execução**
Para visualizar as mudanças antes de aplicá-las:
```sh
terraform plan -out=tfplan
```

### 1.3 **Aplicar as Configurações**
Execute o seguinte comando para provisionar toda a infraestrutura:
```sh
terraform apply -auto-approve "tfplan"
```

---

## 2. Configuração do Kubernetes
Após a criação do cluster AKS, configure o acesso ao Kubernetes:

```sh
az aks get-credentials --resource-group rg-ada-myk --name aks-ada-myk
```

### 2.1 **Implantação da Aplicação**
```sh
kubectl apply -f deployment.tf
```

### 2.2 **Criação do Service**
```sh
kubectl apply -f service.tf
```

### 2.3 **Configuração do Ingress**
```sh
kubectl apply -f ingress.tf
```

### 2.4 **Verificar Recursos no Cluster**
```sh
kubectl get pods,svc,ingress
```

---

## 3. Acesso ao Banco de Dados

### 3.1 **Recuperar a String de Conexão**
Após a criação do SQL Server, recupere a string de conexão com:
```sh
echo "Server=tcp:$(terraform output -raw sql_server_name).database.windows.net,1433;Database=$(terraform output -raw sql_database_name);User ID=$(terraform output -raw sql_admin_username);Password=YOUR_PASSWORD;"
```

### 3.2 **Permitir Acesso via Firewall**
Se precisar liberar sua máquina para acessar o banco de dados:
```sh
curl ifconfig.me # Obtenha seu IP
az sql server firewall-rule create --resource-group rg-ada-myk --server sql-ada-myk --name AllowMyIP --start-ip-address SEU_IP --end-ip-address SEU_IP
```

## 4. Gerenciamento de Segredos
A aplicação usa o **Azure Key Vault** para armazenar credenciais de forma segura. Para verificar os segredos armazenados:
```sh
az keyvault secret list --vault-name kv-ada-myk
```

Para recuperar um segredo específico:
```sh
az keyvault secret show --vault-name kv-ada-myk --name sql-admin-password
```

## 5. Build e Deploy da Aplicação com Docker

Se precisar **criar e executar a aplicação localmente**, use os seguintes comandos:

### 5.1 **Build da Imagem Docker**
```sh
docker build -t application.spd . -f application.spd-dockerfile
```

### 5.2 **Execução do Container**
```sh
docker run -p 8080:8080 application.spd
```

A aplicação estará acessível em:
```
http://localhost:8080
```
### Licenciamento
Este projeto está licenciado sob a **Licença MIT**. Consulte `application` para mais informações sobre a licença.