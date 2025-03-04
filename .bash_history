dig projectnginx.duckdns.org
sudo dnf install dig -y
exit
nslookup projectnginx.duckdns.org
sudo yum install -y bind-utils
sudo apt update && sudo apt install -y dnsutils
sudo dnf install -y bind-utils
nslookup projectnginx.duckdns.org
sudo vi /etc/nginx/conf.d/default.conf
sudo nginx -t
sudo systemctl restart nginx
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --reload
nslookup projectnginx.duckdns.org
sudo dnf install epel-release -y
sudo dnf update -y
sudo dnf install snapd -y
sudo systemctl enable --now snapd
sudo dnf install certbot python3-certbot-nginx -y
sudo dnf install python3 python3-pip -y
pip3 install certbot certbot-nginx
certbot --version
sudo certbot certonly --manual --preferred-challenges dns -d projectnginx.duckdns.org
certbot certonly --manual --preferred-challenges dns -d projectnginx.duckdns.org
sudo ln -s $(which certbot) /usr/bin/certbot
sudo certbot certonly --manual --preferred-challenges dns -d projectnginx.duckdns.org
pip3 show certbot
which certbot
python3 -m certbot --version
python3 -m certbot certonly --manual --preferred-challenges dns -d projectnginx.duckdns.org
pip3 uninstall certbot -y
pip3 install certbot
which certbot
sudo ln -s ~/.local/bin/certbot /usr/bin/certbot
certbot --version
sudo certbot --version
ls -lah /usr/bin/certbot
sudo rm -f /usr/bin/certbot
sudo ln -s $(which certbot) /usr/bin/certbot
ls -lah /usr/bin/certbot
sudo certbot --version
sudo rm -f /usr/bin/certbot
sudo rm -rf /usr/lib/python*/site-packages/certbot*
sudo rm -rf ~/.local/lib/python*/site-packages/certbot*
pip3 uninstall certbot -y
pip3 install --upgrade certbot
sudo ln -s ~/.local/bin/certbot /usr/bin/certbot
sudo certbot --version
exit
sudo dnf update -y
sudo dnf install nginx -y
sudo systemctl enable --now nginx
systemctl status nginx
END
sudo firewall-cmd --add-service=http --permanent
sudo dnf install firewall -y
sudo dnf install firewalld -y
sudo systemctl enable --now firewalld
sudo systemctl status firewalld
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd -reload
sudo firewall-cmd --reload
sudo dnf install openssl -y
sudo mkdir -p /etc/ssl/private /etc/ssl/certs
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
sudo nano /etc/nginx/conf.d/default.conf
sudo dnf install nano -y
sudo nano /etc/nginx/conf.d/default.conf
sudo vi /etc/nginx/conf.d/default.conf
sudo systemctl restart nginx
sudo systemctl enable nginx
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --reload
curl -k https://3.86.145.187
sudo certbot --version
sudo rm -f /usr/bin/certbot
sudo rm -rf /usr/lib/python*/site-packages/certbot*
sudo rm -rf ~/.local/lib/python*/site-packages/certbot*
pip3 uninstall certbot -y
sudo dnf install epel-release -y
sudo dnf install certbot -y
wget https://dl.eff.org/certbot-auto
chmod +x certbot-auto
sudo mv certbot-auto /usr/bin/certbot
wget https://dl.eff.org/certbot-auto
-bash: wget: command not found
[ec2-user@ip-172-31-88-244 ~]$ chmod +x certbot-auto
chmod: cannot access 'certbot-auto': No such file or directory
[ec2-user@ip-172-31-88-244 ~]$ sudo mv certbot-auto /usr/bin/certbot
mv: cannot stat 'certbot-auto': No such file or directory
sudo dnf install wget -y
chmod +x certbot-auto
wget https://dl.eff.org/certbot-auto
curl -O https://dl.eff.org/certbot-auto
 curl -O https://dl.eff.org/certbot-auto
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: dl.eff.org
ping -c 4 8.8.8.8
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
curl -O https://dl.eff.org/certbot-auto
curl ifconfig.me
exit
wget https://dl.eff.org/certbot-auto
exit
curl "https://projectnginx.duckdns.org"
