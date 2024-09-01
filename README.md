
# DeployQuizAppOnAWS

The task was to take Quiz Application and deploy it to AWS using a serverless architecture while utilizing Terraform to define the infrastructure as code (IAC). This approach allows for reproducible and version-controlled infrastructure deployment.

## 🔗 Quiz-App Deployed Links 
 http://quizappdeploytask.s3-website-us-east-1.amazonaws.com/




## Features

- Serverless Deployment with Terraform
- Database Storage with Terraform
- Security with Terraform
- Monitoring and Logging with Terraform


## AWS Set-Up with Vs-code


 ```bash
  Terraform: Download and install Terraform from the official website. 
 ```

 ```bash
  AWS CLI: Install the AWS CLI from AWS CLI installation guide. 
  Configure it with aws configure.
 ```
 ```bash
  After installing, you need to configure your AWS CLI with your 
  AWS credentials

   You will be prompted to enter your AWS Access Key ID, AWS Secret 
   Access  Key, Default region name, and Default output format.

 Use Terraform with AWS in VS Code
 --------------------------------------
 Using Terraform to manage your AWS infrastructure:

 1.Create a Terraform Configuration:

 2.Initialize Terraform:
 Use the terminal in VS Code to run 'terraform init' in your project directory.
 Manage AWS Resources:

 3.Use Terraform commands (terraform plan, terraform apply) from 
 within VS Code's integrated terminal to manage AWS resources.

```

## Screenshots

S3-Bucket

![Screenshot from 2024-09-01 21-16-51](https://github.com/user-attachments/assets/f78f9ea0-bdc6-4e76-924f-f4c80a15779e)

DynamoDB
![Screenshot from 2024-09-01 21-17-35](https://github.com/user-attachments/assets/fe818a85-ae56-4e7a-b94e-fe33189afd8f)

Lambda

![Screenshot from 2024-09-01 21-18-28](https://github.com/user-attachments/assets/097ae024-93ef-4cd9-b616-edb291e3de8c)

CloudWatch

![Screenshot from 2024-09-01 21-19-44](https://github.com/user-attachments/assets/0d0a3e7b-4b4f-4088-b702-84065311a3d9)

IAM

![Screenshot from 2024-09-01 21-20-41](https://github.com/user-attachments/assets/ac43c626-278f-4067-ac19-a28f055e0406)



