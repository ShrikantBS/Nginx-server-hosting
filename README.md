# Drive Link of the sample website: [Drive Link](https://drive.google.com/file/d/1EeNykN_myBsbX0jHbiqh5dqSwzOaPo_A/view?usp=sharing)
# Secure Web Server Deployment and SSL Configuration on RHEL/Rocky Linux 9

This guide provides a step-by-step approach to deploying an **Nginx web server** on an **AWS EC2 instance** running **RHEL/Rocky Linux 9**, securing it with **Let's Encrypt SSL certificates**, and ensuring auto-renewal.

---

## Prerequisites

- An **AWS EC2 instance** running **RHEL/Rocky Linux 9**.
- A **registered domain/subdomain** (e.g., [projectnginx.duckdns.org](projectnginx.duckdns.org)).
- **Root or sudo privileges** on the EC2 instance.
- **Firewall configured** to allow HTTP (80) and HTTPS (443).
- **DuckDNS account** (if using DuckDNS for free domain hosting).

---

## Step 1: Update System Packages

Ensure your system is updated before proceeding.

```sh
sudo dnf update -y
```

---

## Step 2: Install and Configure Nginx

### Install Nginx
To install Nginx on RHEL/Rocky Linux 9, run the following command:

```sh
sudo dnf install nginx -y
```
### Enable and Start Nginx
#### Once installed, enable and start the Nginx service:
```sh
sudo systemctl enable --now nginx
```
#### To check if Nginx is running:
```sh
sudo systemctl status nginx
```
### Configure Firewall to Allow Web Traffic
#### Ensure that your firewall allows HTTP (port 80) and HTTPS (port 443) traffic:
```sh
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```
#### This ensures that your web server can accept requests over the internet.

---

## Step 3: Install Certbot for SSL
### Install Certbot and Dependencies
```sh
sudo dnf install epel-release -y
sudo dnf install certbot python3-certbot-nginx -y
```

---

## Step 4: Obtain SSL Certificate Using DNS Challenge
### Run the following command to generate an SSL certificate for your domain:
```sh
sudo certbot certonly --manual --preferred-challenges dns -d projectnginx.duckdns.org
```
- Certbot will prompt you to add a DNS TXT record.
- Use the DuckDNS API to add the TXT record:
```sh
curl "https://www.duckdns.org/update?domains=projectnginx&token=YOUR_DUCKDNS_TOKEN&txt=YOUR_CERTBOT_VALUE"
```
- Verify the TXT record using:
```sh
dig -t TXT _acme-challenge.projectnginx.duckdns.org
```
- Once verified, press Enter in the Certbot prompt to proceed.

---

## Step 5: Configure Nginx for SSL
#### Edit the Nginx configuration:
```sh
sudo nano /etc/nginx/conf.d/default.conf
```
#### Replace the contents with:
```sh
server {
    listen 80;
    server_name projectnginx.duckdns.org;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name projectnginx.duckdns.org;

    ssl_certificate /etc/letsencrypt/live/projectnginx.duckdns.org/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/projectnginx.duckdns.org/privkey.pem;

    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}
```
#### Save and exit.

---

## Step 6: Restart Nginx to Apply SSL Configuration
```sh
sudo nginx -t
sudo systemctl restart nginx
```

---

## Step 7: Set Up Auto-Renewal for SSL Certificate
#### To ensure automatic renewal of the SSL certificate, add a cron job:
```sh
echo "0 0 * * * root certbot renew --quiet" | sudo tee /etc/cron.d/certbot-renew
```

--- 

## Step 8: Verify Deployment
#### Check SSL Certificate
```sh
sudo certbot certificates
```

---

### Visit the Secured Website
### Open a browser and visit:
🔗 [https://projectnginx.duckdns.org](https://projectnginx.duckdns.org)

### You should see your website secured with HTTPS.

---

## Conclusion

### You have successfully: 
### ✅ Deployed Nginx on an AWS EC2 instance (RHEL/Rocky Linux 9).
### ✅ Secured it with a Let's Encrypt SSL Certificate using a DNS Challenge.
### ✅ Configured automatic certificate renewal.

### Your website is now secure and production-ready! 🎉

