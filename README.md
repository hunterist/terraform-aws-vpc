AWS VPC Build By Terraform 
================================================================================

This repository contains a [Terraform](https://www.terraform.io/) project that builds [Scenario 2: VPC with Public and Private Subnets](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html) from the AWS documentation.


Requirements
--------------------------------------------------------------------------------


Tool       | Version      | Purpose
:--------- | :----------- | :---------------------------------------------------
Terraform  | 0.7.5        | AWS infrastructure management


AWS Infrastructure
--------------------------------------------------------------------------------
**I. IAM**

1.1 User

| Name           | Access Key Id    | Access Key Secret | Attached Policy
| -------------- | ---------------- | ----------------- | ---------------------
| hunterist-prod | YOUR ACCESS KEY  | YOUR SECRET KEY   | Hunterist-Prod-Policy


1.2 Policy

| Name                    | Type       | Resource
| ----------------------- | ---------- | ---------------------------  
| Hunterist-Prod-Policy   | S3         | hunterist-prod
|                         | SQS        | hunterist_prod_campaign_util
|                         | SQS        | hunterist_prod_low_priority_scene_request
|                         | SQS        | hunterist_prod_low_priority_scene_response
|                         | SQS        | hunterist_prod_video_scene
|                         | SQS        | hunterist_prod_video_scene_result


**II. VPC**

2.1 VPC

| Name               | CIDR Block
| ------------------ | ----------------
| Hunterist-Prod-VPC | 10.201.0.0/16


2.2 Subnets

| Name                       | CIDR Block       | Availability Zone
| -------------------------- | ---------------- | ----------------- 
| Hunterist-Prod-Front01     | 10.201.0.0/24    | ap-northeast-1a 
| Hunterist-Prod-Front02     | 10.201.1.0/24    | ap-northeast-1c
| Hunterist-Prod-RDS01       | 10.201.2.0/24    | ap-northeast-1a
| Hunterist-Prod-RDS02       | 10.201.3.0/24    | ap-northeast-1c
| Hunterist-Prod-Pipeline01  | 10.201.4.0/24    | ap-northeast-1a
| Hunterist-Prod-Pipeline02  | 10.201.5.0/24    | ap-northeast-1c


2.3 Gateways

| Name                       | Type
| -------------------------- | ----------------------
| Hunterist-Igw-Prod-VPC     | Internet Gateway


2.4 Route Tables

| Name                       | Destination      | Target               
| -------------------------- | ---------------- | ------------------------|
| Hunterist-Prod-Public-RT   | 0.0.0.0/0        | Hunterist-Igw-Prod-VPC  


2.5 Network NACL

| Name                       | Inbound          | Outbound                | Subnets
| -------------------------- | ---------------- | ------------------------| ----------------------
| Hunterist-Prod-Public-RT   |                  |                         | Hunterist-Prod-Front01
|                            |                  |                         | Hunterist-Prod-Front02
|                            |                  |                         | Hunterist-Prod-RDS01
|                            |                  |                         | Hunterist-Prod-RDS02
|                            |                  |                         | Hunterist-Prod-Pipeline01
|                            |                  |                         | Hunterist-Prod-Pipeline02


2.6 Security Group

| Name                       | Inbound Rules    | Outbound Rules          
| -------------------------- | ---------------- | ------------------------
| Hunterist-Prod-Front-SG    |                  |                         
| Hunterist-Prod-RDS-SG      |                  |      
| Hunterist-Prod-Pipeline-SG |                  |                          
| Hunterist-Prod-Front-ELB   |                  |       


**III. EC2**

3.1 Front01

| Item            | Value          
| --------------- | ----------------
| Name            | Hunterist-Prod-Front01
| Instance Type   | m3.medium      
| Elastic IP      | 52.197.205.111      
| OS              | Ubuntu 14.04
| SSH User        | ubuntu
| SSH Key Pair    | hunterist-prod-front01
| SSH Port        | 22
| IAM Role        | hunterist-prod
| Security Group  | Hunterist-Prod-Front-SG


3.2 Front02

| Item            | Value          
| --------------- | ----------------
| Name            | Hunterist-Prod-Front01
| Instance Type   | m3.medium     
| Elastic IP      | 52.197.205.112      
| OS              | Ubuntu 14.04
| SSH User        | ubuntu
| SSH Key Pair    | hunterist-prod-front02
| SSH Port        | 22
| IAM Role        | hunterist-prod
| Security Group  | Hunterist-Prod-Front-SG


3.3 Pipeline01

| Item            | Value          
| --------------- | ----------------
| Name            | Hunterist-Prod-Pipeline01
| Instance Type   | c4.xlarge     
| Elastic IP      | 52.197.205.113      
| OS              | Window
| RDP User        | Administrator
| RDP Password    | 
| RDP Port        | 3389
| IAM Role        | hunterist-prod
| Security Group  | Hunterist-Prod-Pipeline-SG


3.4 Pipeline02

| Item            | Value          
| --------------- | ----------------
| Name            | Hunterist-Prod-Pipeline02
| Instance Type   | c4.xlarge     
| Elastic IP      | 52.197.205.114      
| OS              | Window
| RDP User        | Administrator
| RDP Password    | 
| RDP Port        | 3389
| IAM Role        | hunterist-prod
| Security Group  | Hunterist-Prod-Pipeline-SG


**IV. RDS**

4.1 Master

| Item               | Value          
| ------------------ | ----------------
| Replication Role   | Master
| Instance Type      | db.r3.large     
| Engine             | PostgreSQL 9.5.4  
| Endpoint           | 
| Port               | 5432
| Username           | hunterist
| DB Name            | hunterist
| DB Password        | 
| Storage            | 32GB
| Multi AZ           | No
| Encryption Enabled | Yes
| Security Group     | Hunterist-Prod-RDS-SG


4.1 Replica

| Item               | Value          
| ------------------ | ----------------
| Replication Role   | Replica
| Instance Type      | db.m4.large     
| Engine             | PostgreSQL 9.5.4  
| Endpoint           | 
| Port               | 5432
| Username           | hunterist
| DB Name            | hunterist
| DB Password        | 
| Storage            | 32GB
| Multi AZ           | No
| Encryption Enabled | Yes
| Security Group     | Hunterist-Prod-RDS-SG


**V. S3** (please check source code to understand)


**VI. SQS** (please check source code to understand)


**VII. EIP** (We dont need using these ip if we already have ELB)


**VIII. ELB**

| Item               | Value          
| ------------------ | ----------------
| Name               | Hunterist-Prod-FrontELB
| Instances          | Hunterist-Prod-Front01, Hunterist-Prod-Front02
| Subnets            | Hunterist-Prod-Front01, Hunterist-Prod-Front02
| Port On ELB        | 80, 443
| Port On Instances  | 80


Running
--------------------------------------------------------------------------------
Plan:

```sh
$ terraform plan
```

Apply:

```sh
$ terraform apply
```

Destroy:

```sh
$ terraform destroy
```