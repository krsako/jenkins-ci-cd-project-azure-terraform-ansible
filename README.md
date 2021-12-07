## Terraform and ansible roles using Jenkins for CI/CD

### Using terraform deploys the following on Azure Cloud:
**1. Deploys a Linux VM**
**2. Deploy two azure kubernetes clusters(test/dev) to host application**
**3. Generate two kube-config files locally to connect to our cluster**

Commands to run terraform:  
*terraform init*
*terraform apply*

**Ansible configures the Linux VM to deploy a Jenkins server for automated deployments**

Ansible has 3 roles to install and configure docker, kubernetes and jenkins.