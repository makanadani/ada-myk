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
