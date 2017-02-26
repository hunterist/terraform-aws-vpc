Hunterist AWS VPC Build By Terraform 
================================================================================

This repository contains a [Terraform](https://www.terraform.io/) project that builds [Scenario 2: VPC with Public and Private Subnets](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html) from the AWS documentation.


Requirements
--------------------------------------------------------------------------------


Tool       | Version      | Purpose
---------- | ------------ | ----------------------------------------------------
Terraform  | 0.7.5        | AWS infrastructure management


AWS Infrastructure
--------------------------------------------------------------------------------
**I. IAM**

1.1 User
| Name           | Access Key Id    | Access Key Secret | Attached Policy
| :-------       | :-------         | :-------          |  :-------
| hunterist-prod | YOUR ACCESS KEY  | YOUR SECRET KEY   | Hunterist-Prod-Policy

1.2 Policy
| Name                    | Type       | Resource
| :-------                | :-------   | :-------  
| Hunterist-Prod-Policy   | S3         | hunterist-prod
|                         | SQS        | hunterist_prod_campaign_util
|                         | SQS        | hunterist_prod_low_priority_scene_request
|                         | SQS        | hunterist_prod_low_priority_scene_response
|                         | SQS        | hunterist_prod_video_scene
|                         | SQS        | hunterist_prod_video_scene_result



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