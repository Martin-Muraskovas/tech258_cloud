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
`sudo DEBIAN_FRONTEND=noninteractive apt update -y`

3. Upgrade packages.<br>
`sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y`

4. Installing nginx.<br>
`sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y`

5. Restarting nginx.<br>
`sudo systemctl restart nginx`

6. Enabling nginx.<br>
`sudo systemctl enable nginx`

7. Install node version 20.<br>
`curl -fsSL https://deb.nodesource.com/setup_20.x | sudo DEBIAN_FRONTEND=noninteractive -E bash - &&\`
`sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs`

8. Check the node.js version.<br>
`node -v`

9. Create an apps folder and change into it.<br>
`mkdir apps`
`cd apps`

10. Clone the folder containing the app.<br>
`git clone https://github.com/Martin-Muraskovas/tech258-sparta-test-app.git`

11.  Change into the app folder.<br>
`cd ~/apps/tech258-sparta-test-app/app`

12. Install npm
`sudo npm install`

13. Install pm2
`sudo npm install -g pm2`

14. Stop all processes that pm2 is managing
`sudo pm2 stop all`

15. Start app.js using pm2
`sudo pm2 start node app.js`
