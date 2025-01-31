AUTORA: Marina Yumi Kanadani

Embarque TI | Serviços para Desenvolvedores

[*Projeto Ada MYK*](./projeto_modulo.md)

# Documentação da Infraestrutura com Terraform e Kubernetes

## Introdução
Este documento descreve a infraestrutura implementada utilizando **Terraform** para provisionamento de recursos no **Microsoft Azure** e **Kubernetes** para a implantação de uma aplicação conteinerizada. 

## Estrutura dos Arquivos
A infraestrutura está organizada em diversos arquivos Terraform, cada um com uma responsabilidade específica:

| Arquivo | Descrição |
|---------|-------------|
| `aks.tf` | Provisiona o cluster **Azure Kubernetes Service (AKS)**. |
| `application.spd-dockerfile` | Dockerfile para criar a imagem da aplicação. |
| `database.tf` | Cria o **Azure SQL Server** e o **banco de dados**. |
| `deployment.tf` | Define a **implantacão (Deployment)** da aplicação no Kubernetes. |
| `firewall.tf` | Configurações de firewall para proteger o SQL Server. |
| `ingress.tf` | Configura o **Ingress** para exposição externa da aplicação. |
| `keyvault.tf` | Provisiona o **Azure Key Vault** para armazenar segredos de forma segura. |
| `keyvault-secret.tf` | Adiciona segredos no **Key Vault**. |
| `managed-identity.tf` | Cria uma **Managed Identity** para a aplicação acessar recursos sem credenciais explícitas. |
| `network.tf` | Define a **Virtual Network (VNet)** e **Subnet**. |
| `providers.tf` | Configura os provedores Terraform. |
| `resource-group.tf` | Cria o **Resource Group** onde todos os recursos serão implantados. |
| `role.tf` | Atribui permissões necessárias para a **Managed Identity** acessar os recursos. |
| `secrets.auto.tfvars` | Armazena valores sensíveis como senhas e segredos. |
| `service-account.tf` | Cria uma **Service Account** para autenticação no Kubernetes. |
| `service.tf` | Define o **Service** no Kubernetes para expor a aplicação internamente. |
| `variables.tf` | Define variáveis reutilizáveis no Terraform. |
| `ada-azure-project-2025-01.sln` | Arquivo de solução do **Microsoft Visual Studio** para compilação da aplicação. |

---

## 1. Provisionamento da Infraestrutura

### 1.1 **Inicialização do Terraform**
Antes de aplicar as configurações, execute o seguinte comando para inicializar os provedores Terraform:

```sh
terraform init
```

### 1.2 **Visualizar o Plano de Execução**
Para visualizar as mudanças antes de aplicá-las:
```sh
terraform plan
```

### 1.3 **Aplicar as Configurações**
Execute o seguinte comando para provisionar toda a infraestrutura:
```sh
terraform apply -auto-approve
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

---

## 4. Gerenciamento de Segredos
A aplicação usa o **Azure Key Vault** para armazenar credenciais de forma segura. Para verificar os segredos armazenados:
```sh
az keyvault secret list --vault-name kv-ada-myk
```

Para recuperar um segredo específico:
```sh
az keyvault secret show --vault-name kv-ada-myk --name sql-admin-password
```

---

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

---

## 6. Licenciamento
Este projeto está licenciado sob a **Licença MIT**. Consulte `application` para mais informações sobre a licença.

---

## 7. Conclusão
Com este documento, você pode:
✅ Provisionar toda a infraestrutura no Azure com Terraform.
✅ Configurar e implantar a aplicação no Kubernetes.
✅ Acessar e gerenciar segredos com o Azure Key Vault.
✅ Implementar um banco de dados SQL seguro.
✅ Criar e rodar a aplicação localmente via Docker.

Para qualquer dúvida, entre em contato.
