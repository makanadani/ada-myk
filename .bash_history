git clone https://github.com/makanadani/ada-myk.git
cd ada-myk
git init
terraform init
terraform validate
terraform plan -out=tf-plan
terraform apply "tf-plan"
kubectl cluster-info
kubectl config get-contexts
az aks get-credentials --resource-group rg-ada-myk --name aks-ada-myk
kubectl cluster-info
kubectl cluster-info dump
ls
cd /home/marina
cp --parents -r * ~/ada-myk/
