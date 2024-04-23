- [Deploying a node.js App on an EC2 instance](#deploying-a-nodejs-app-on-an-ec2-instance)
  - [Prerequisites](#prerequisites)
  - [Running the app.](#running-the-app)


# Deploying a node.js App on an EC2 instance

## Prerequisites
Please follow part 1 of this [guide](https://github.com/Martin-Muraskovas/tech258_cloud/blob/main/readme.md).

When you get to the security settings. Add a Custom TCP with the port 3000. Port 3000 is the default port for node.js applications.

## Running the app.

1. Disable the kernel update prompt<br>
`sudo sed -i "s/#\$nrconf{kernelhints} = -1;/\$nrconf{kernelhints} = -1;/g" /etc/needrestart/needrestart.conf`

2. Update packages.<br>
`sudo apt update -y`

3. Upgrade packages.<br>
`sudo apt upgrade -y`

4. Installing nginx.<br>
`sudo apt install nginx -y`

5. Restarting nginx.<br>
`sudo systemctl restart nginx`

6. Enabling nginx.<br>
`sudo systemctl enable nginx`

7. Install node version 20.<br>
`curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\`
`sudo apt-get install -y nodejs`

8. Check the node.js version.<br>
`node -v`

9. Create an apps folder and change into it.<br>
`mkdir apps`
`cd apps`

10. Clone the folder containing the app.<br>
`git clone https://github.com/Martin-Muraskovas/tech258-sparta-test-app.git`

11.  Change into the app folder.<br>
`cd ~/apps/tech258-sparta-test-app/app`

12.   Ensure that the app is running in the background and can be ran multiple times with no errors.<br>
`nohup node app.js` or `nohup node app.js &`
