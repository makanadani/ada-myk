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
