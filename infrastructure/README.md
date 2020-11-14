# How to create infrastructure for a cluster 
In this folder, you could find automation scripts for infrastructure creation and provisioning.


#### Step 0 - AWS credentials setup 
On this step, we have to add secret keys to the environment variables.
```bash
$ mv .env.template .env
$ vim .env
or
$ export AWS_ACCESS_KEY_ID=<>
$ export AWS_SECRET_ACCESS_KEY=<>
```


#### Step 1 - Build ami
On this step, we will create an image with pre-installed Docker CE.
```bash
$ cd packer
$ packer build ami_docker.json
$ cd -
```


#### Step 2 - Create infra on AWS
On this step, we will spin up EC2 instances with all of the network settings in place.
```bash
$ cd terraform
$ terraform init
$ terraform apply -input=false
$ cd -
```


#### Step 3 - Create Docker Swarm Cluster
On this step, we will create a Docker Swarm cluster with N-nodes and M-managers.
```bash
$ cd ansible
$ ansible-playbook -i ./inventory/hosts setup_swarm_cluster.yml
$ cd -
```


### Hints
```bash
$ docker context create swarm-aws --docker host=ssh://ec2-user@<manager-ip>
$ docker context use swarm-aws
```


### Links
[Packer Docs](https://www.packer.io/docs/terminology)

[Terraform Docs](https://www.terraform.io/docs/configuration/index.html)

[Ansible Docs](https://docs.ansible.com/ansible/latest/index.html)

[Docker Swarm Docs](https://docs.docker.com/engine/swarm/)


### TODO
* add more ansible playbooks for cluster management (leave, promote, etc.).