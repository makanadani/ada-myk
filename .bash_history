ls
git clone https://github.com/makanadani/ada-myk
cd ada-myk
git init
git add .
git commit -m "Fix secrets.tf"
git config --global user.email "makanadani@pm.me"
git config --global user.name "Marina Yumi Kanadani"
git commit -m "Fix secrets.tf"
ls
cp -rf /home/marina/* /home/marina/ada-myk/
[200~find /home/marina -maxdepth 1 -type f -exec cp -f {} /home/marina/ada-myk/ \;~
find /home/marina -maxdepth 1 -type f -exec cp -f {} /home/marina/ada-myk/ \;
ls
rm -rf ada-myk
git add .
git commit -m "Update files"
git push origin main
terraform init
terraform validate
vi keyvault.tf
terraform refresh
terraform init
terraform validate
terraform plan -out=tfplan
terraform apply -auto-approve "tfplan"
terraform import azurerm_mssql_server.sql_server /subscriptions/59890415-2a07-415b-bf3f-a9d3a12caa38/resourceGroups/rg-ada-myk/providers/Microsoft.Sql/servers/sql-ada-myk
terraform import azurerm_user_assigned_identity.aks_identity /subscriptions/59890415-2a07-415b-bf3f-a9d3a12caa38/resourceGroups/rg-ada-myk/providers/Microsoft.ManagedIdentity/userAssignedIdentities/aks-workload-identity
terraform import azurerm_resource_group.environment_rg /subscriptions/59890415-2a07-415b-bf3f-a9d3a12caa38/resourceGroups/rg-ada-myk
kubectl cluster-info
cat ~/.kube/config
az aks get-credentials --resource-group rg-ada-myk --name aks-ada-myk
find /home/marina -maxdepth 1 -type f -exec cp -f {} /home/marina/ada-myk/ \;
ls
git add .
git commit -m "Fix network"
git push origin main
terraform init
terraform validate
ls
git pull
git init
git config --global init.defaultBranch main
git branch -m main
terraform init
terraform validate
terraform plan -out=tfplan
terraform apply "tfplan"
terraform import azurerm_mssql_server.sql_server /subscriptions/59890415-2a07-415b-bf3f-a9d3a12caa38/resourceGroups/rg-ada-myk/providers/Microsoft.Sql/servers/sql-ada-myk
terraform import azurerm_user_assigned_identity.aks_identity /subscriptions/59890415-2a07-415b-bf3f-a9d3a12caa38/resourceGroups/rg-ada-myk/providers/Microsoft.ManagedIdentity/userAssignedIdentities/aks-workload-identity
terraform import azurerm_resource_group.environment_rg /subscriptions/59890415-2a07-415b-bf3f-a9d3a12caa38/resourceGroups/rg-ada-myk
terraform init
terraform validate
terraform plan -out=tfplan
terraform apply "tfplan"
terraform import azurerm_mssql_database.sql_database /subscriptions/59890415-2a07-415b-bf3f-a9d3a12caa38/resourceGroups/rg-ada-myk/providers/Microsoft.Sql/servers/sql-ada-myk/databases/db-ada-myk
terraform import azurerm_mssql_firewall_rule.allow_client_ip /subscriptions/59890415-2a07-415b-bf3f-a9d3a12caa38/resourceGroups/rg-ada-myk/providers/Microsoft.Sql/servers/sql-ada-myk/firewallRules/AllowMyIP
kubectl cluster-info
kubectl config view
az aks get-credentials --resource-group rg-ada-myk --name aks-ada-myk
curl -k https://<kubernetes-api-server>:6443
kubectl cluster-info dump
terraform plan -out=tfplan
terraform apply "tfplan"
kubectl cluster-info
kubectl config view
az aks show --resource-group rg-ada-myk --name aks-ada-myk --query "provisioningState"
curl -k https://k8s-b2yrkqnf.hcp.brazilsouth.azmk8s.io:443
az aks get-credentials --resource-group rg-ada-myk --name aks-ada-myk --overwrite-existing
kubectl proxy --port=8080
lsof -i :8080
netstat -tuln | grep 8080
ss -tuln | grep 8080
ps -p 511 -o comm=
ss -tuln | grep 8080
netstat -tulnp | grep 8080
kubectl proxy --port=8081
find /home/marina -maxdepth 1 -type f -exec cp -f {} /home/marina/ada-myk/ \;
ls
cd ada-myk
ls
