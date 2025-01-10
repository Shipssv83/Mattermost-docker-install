Hi, ![](https://user-images.githubusercontent.com/18350557/176309783-0785949b-9127-417c-8b55-ab5a4333674e.gif)my name is Serhii Shypylov
=========================================================================================================================================

-------------------------------

### Socials

<p align="left"> <a href="https://github.com/Shipssv83" target="_blank" rel="noreferrer"> <picture> <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/github-dark.svg" /> <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/github.svg" /> <img src="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/github.svg" width="32" height="32" /> </picture> </a> <a href="https://www.linkedin.com/in/sergey-shipilov-7262a31b4/" target="_blank" rel="noreferrer"> <picture> <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/linkedin-dark.svg" /> <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/linkedin.svg" /> <img src="https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/socials/linkedin.svg" width="32" height="32" /> </picture> </a></p>
---

# Ansible Playbook for Server, Docker, and Mattermost Installation

This repository contains Ansible playbooks for setting up a server, installing Docker, and deploying Mattermost in a Docker container with necessary volume configuration.

## Playbook Overview

The project includes the following key steps:
1. **Server Setup**: Installs necessary packages and configures the server environment.
2. **Docker Installation**: Installs Docker and Docker Compose for managing containers.
3. **Mattermost Deployment**: Deploys Mattermost inside a Docker container with all required configurations.

## Playbook Structure

### 1. Server Setup (`server-install.yml`)
This playbook installs essential software and configures basic settings such as timezone.

### 2. Docker Installation (`docker-install.yml`)
The `docker-install.yml` playbook installs Docker and Docker Compose on the target host, preparing the system for containerized applications.

### 3. Mattermost Docker Installation (`mattermost-docker-install.yml`)
This playbook deploys Mattermost in a Docker container and sets up necessary volumes for storing data, configuration, logs, and plugins.

## Requirements

- Ansible 2.9+ installed on the control node.
- SSH access to the target server.
- A Linux-based server (Ubuntu, CentOS, etc.) with internet access.
- Docker and Docker Compose will be installed automatically.

## Roles

The playbook makes use of the following roles:
- **roles/server-install**: Configures the server environment.
- **roles/docker-install**: Installs Docker and Docker Compose.
- **roles/mattermost-docker-install**: Deploys Mattermost using Docker and sets up necessary volumes and configurations.

## Variables

You can customize the playbook by modifying the following variables:

- `mattermost_volumes`: List of directories where Mattermost stores its data.
- `mattermost_url`: The URL or hostname where Mattermost will be accessible.
- `timezone`: The server's timezone (default: `Europe/Warsaw`).
- `mattermost_db_user`: The database user for Mattermost.
- `mattermost_db_pass`: The password for the Mattermost database user.
- `mattermost_db_database`: The name of the Mattermost database.

### Example Variable Configuration:

```yaml
vars:
  mattermost_volumes:
    - "config"
    - "data"
    - "logs"
    - "plugins"
    - "client"
    - "bleve-indexes"
  mattermost_url: '{{ host }}'
  timezone: "Europe/Warsaw"
  mattermost_db_user: "mattermost"
  mattermost_db_pass: "0gtfKcpjz5tBNm"
  mattermost_db_database: "mattermost_db"
```

# ansible galaxy roles
```
### install role ansible galaxy
ansible-galaxy install -r roles/requirements.yml

### upgrade role ansible galaxy 
ansible-galaxy install -g -f -r roles/requirements.yml
```

# Run the Playbook install
Run the playbook by specifying your inventory file and variable file:

```
ansible-playbook -i inventory --user root --extra-vars "host=host_name" playbooks/mattermost-docker-install.yml
```

License
This project is licensed under the MIT License