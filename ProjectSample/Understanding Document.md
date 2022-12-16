# Understanding Document
The Project v 1.0 infrastructure as code is trying to help a company who has an on-premises infrastructure to move their infrastructure to the cloud with minimum cost.
In this Project v1.0 , the application is implemented in Bicep code to automate this move .

We have got a set a set of requirements from the client and here are the understandings as per those requirements.


The client need 2 servers , one is a management server which is ideal if it is windows server and a web server which is a linux server.
These 2 servers are in the same region closest to the client but in 2 different availability zones. So we need 2 virtual machines , one linux server vm and one windows server vm . 
These 2 vms should be placed in 2 different virtual networks with its own subnets in the 10.10.10.0/24 & 10.20.20.0/24 CIDR blocks.

The management server and webserver both need its own static public ip address. The management server is accessible to only few users. The web server is accessible to the public using the public DNS name.
We have Network Security Group Rules in place for controlling the traffic to both the servers.
The managements servers NSG rules allow inbound to port 3389 and 22 from restricted users and I have given my ip address as the only address which can access the management server, through those ports.
The web servers NSG rules allow inbound to port 80 and 22. The port 80 is open for public. So when you try accessing the webserver it will show the default page of Apache.
The port 22 is accessible through SSH from only the management server. The management server public ip address will only give access to the web server.

These 2 virtual networks are peered using peering and connected. The peering is done from both sides.

We need a storage account also which will upload a file with the deployment script in it from the local machine and store it as a blob in the storage account. This file is used as a custom data during the creation of the web server, which will automatically make it into a web server. The Apache install script will be run automatically.

The same storage account is reused for the management server for boot diagnostics logs. 

The recovery service vault is used for backing up the web server. The recovery service vault requires you to create a policy for the schedule of back up. The back up has to created daily and the back up has to be retained for 7 days. 

The disks in the vms need to be encrypted for that azure encryption disks with the key vault is used. 

The resources which are need to meet these requirements are:

Storage Account

DeploymentScripts

Virtual machine (Linux)

Virtual machine(Windows)

Virtual Network

Subnets

NIC- Network Interfaces

Network Security Groups

Public IP Address

Virtualmachine/Extensions

Virtual Network Peering

Recovery Service Vault

Recovery Service Vault/policies

Recovery Service Vault/../Protected Items

KeyVaults

