# This Documentation is for deployment of this node application on EC2 instance as a Docker container

## Prerequisites 
- Terraform
- Docker

## Process to Deploy Infrastructure on AWS (EC2, Security Group, Key Pair)

### Step 1: Clone the Repo
```
git clone https://github.com/vikashkumar0712/node-todo-cicd/
```
### Step 2: Go to Terraform Directory
```
cd terraform
```
### Step 3: Initialize the terraform in the Directory
```
terraform init
```
### Step 4: Modify the Terraform provider.tf with proper creds
### Step 5: Create a ssh key pair which we will attach to ec2 install
```
ssh-keygen
//Create this key in ./id_rsa location the keys should be replaced with my sample key files
```
### Step 6: Now Have a look on resources which will create 
```
terraform plan
```
### Step 7: Let's Create the resources
```
terraform apply --auto-approve
```
## Process to build docker image and push to the docker hub (optional and Additional)
```
cd ..
docker build -t <your-username>/<registry-name>:<tag> .
docker login
docker push <your-username>/<registry-name>:<tag>
```
## Steps to Run my written script

### Login to the EC2 instance
```
sudo ssh -i "path/to/key" ubuntu@<public-ip>
```
### Create the script.sh and Paste the Script
```
sudo vim script.sh
// Paste the content of script
```
### Give the executable Permissions to script
```
sudo chmod 777 script.sh
```
### Run the script now
```
./script.sh
```




