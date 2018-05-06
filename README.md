*** WORK IN PROGRESS ***

# Bootstrap Kubernetes on ESXi using Centos
In this tutorial we will be creating a Kubernetes cluster that I am using myself in my homelab. 
Prerequisites are that you are familier with VMware vSphere and have access to it.

Versions that I used for this tutorial:
* MacBook Pro with OSX 10.13.2 (machine to execute this tutorial)
* vSphere 6.5
* CentOS 7 (1708)
* Kubernetes 1.10.0

## Create a Centos virtual machine as basis for your kubernetes hosts
[Download](https://www.centos.org/download/) a copy of CentOS 7 (I used the Minimal ISO)

* Upload the ISO image to a datastore on the ESXi server
* Create a new VM called "CentOS7_template" and mount the downloaded image.
![Alt text](relative/path/to/img.jpg?raw=true "Title")
* Power on the create VM and walkthrough the CentOS 7 setup
* When the setup is finished and the VM is rebooted we are ready for the next step

##  Configuration of the Centos7 VM

Login to the newly created CentOS7 VM and lookup its IP address (ip a).
Change the following section in hosts.yml with your config:

```
CentOS7_template:
       ansible_host: <IP address>
       ansible_user: root
       ssh_key: "~/.ssh/id_rsa_esxi.pub"
```

Add the following section for each server in ~/.ssh/config:

```
Host 192.168.178.73
  HostName 192.168.178.73
  User tutorial
  IdentityFile ~/.ssh/id_rsa_esxi
```

execute (from the create_cluster folder):
```
ansible-playbook -k bootstrap.yml
```
to:
** create a user 'ansible'
** add user to sudoers
** copy ssh-key from ~/.ssh/id_rsa.pub

Your CentOS building block is ready, power down the VM and go to the next step

## Provisioning the Kubernetes cluster

The VMs that we are going to use for the cluster will be provisioned with ansible, using the template VM 'CentOS7_template' that we created in the previous step.

execute (from the create_cluster folder):
```
ansible-playbook create-cluster.yml
```



 




