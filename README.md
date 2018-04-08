# Bootstrap Kubernetes on ESXi using Centos
In this tutorial we will be creating a Kubernetes cluster that I am using myself in my homelab. 
Prerequisites are that you are familier with VMware vSphere and have access to it.

Versions that I used for this tutorial:
* Ubuntu 16.04 virtual machine to execute this tutorial
* vSphere 6.5
* CentOS 7 (1708)

## Create a Centos virtual machine as basis for your kubernetes hosts
[Download](https://www.centos.org/download/) a copy of CentOS (I used the Minimal ISO)

* Upload the ISO image to a datastore on the ESXi server
* Create a new VM and mount the downloaded image.
![Alt text](relative/path/to/img.jpg?raw=true "Title")
* Power on the create VM and walkthrough the Centos7 setup
* Let the installer create an additional user: 'tutorial'
* When the setup finished and the VM is rebooted we are ready for the next step

##  Configuration of the Centos7 VM
I want to automate the most part of the entire installation, so the only thing we are going to to is to setup an SSH key for the 
tutorial user we created
* Login as root on the VM from the vSphere console and lookup its IP Address
* add the tutorial user to the sudoers:
```
     ssh root@<SERVERIP> 'echo "tutorial ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/tutorial'
```
* copy the ssh-key for the tutorial user (assume a key exists in ~/.ssh/id_rsa.pub)
```
     setup_ssh <SERVERIP> tutorial <tutorial password>
```  

Your CentOS building block is ready, power down the VM and go to the next step

## Provisioning the Kubernetes cluster




 




