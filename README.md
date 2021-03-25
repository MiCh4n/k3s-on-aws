# Deploy k3s on EC2 AWS created by terraform
### Provision infrastructure on AWS using terraform
* #### Creates:
    *  EC2 instance with Elastic IP
    *  VPC
    *  Subnet
    *  Route table
    *  Internet gateway
    *  Security groups with inbound rules to allow SSH and HTTP
### Ansible playbooks to setup k3s on remote instance 
### Deploy sample application on cluster and expose it to external world
---
### Jenkins create plan from terraform files and deploy it on AWS using provided credentials

```
# Create secret for jenkins to access aws
kubectl create secret generic aws-creds \
    --from-file=/home/yuli/.aws/credentials
```
