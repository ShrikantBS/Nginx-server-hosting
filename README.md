# Secure Web Server Deployment and SSL Configuration on RHEL/Rocky Linux 9

This guide provides a step-by-step approach to deploying an **Nginx web server** on an **AWS EC2 instance** running **RHEL/Rocky Linux 9**, securing it with **Let's Encrypt SSL certificates**, and ensuring auto-renewal.

---

## Prerequisites

- An **AWS EC2 instance** running **RHEL/Rocky Linux 9**.
- A **registered domain/subdomain** (e.g., `projectnginx.duckdns.org`).
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
