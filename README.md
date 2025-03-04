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
