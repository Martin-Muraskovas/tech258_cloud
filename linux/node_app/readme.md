# Deploying a node.js App on an EC2 instance

## Prerequisites
Please follow part 1 of this [guide](https://github.com/Martin-Muraskovas/tech258_cloud/blob/main/readme.md).

When you get to the security settings. Add a Custom TCP with the port 3000. Port 3000 is the default port for node.js applications.

## Running the app.

1. Disable the kernel update prompt
`sudo sed -i "s/#\$nrconf{kernelhints} = -1;/\$nrconf{kernelhints} = -1;/g" /etc/needrestart/needrestart.conf`

2. Update packages.
`sudo apt update -y`

3. Upgrade packages.
`sudo apt upgrade -y`

4. Installing nginx.
`sudo apt install nginx -y`

5. Restarting nginx.
`sudo systemctl restart nginx`

6. Enabling nginx.
`sudo systemctl enable nginx`

7. Install node version 20.
`curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\`
`sudo apt-get install -y nodejs`

8. Check the node.js version.
`node -v`

9. Clone the folder containing the app.
`git clone https://github.com/Martin-Muraskovas/tech258-sparta-test-app.git`

10. Change into the app folder.
`cd ~/apps2/tech258-sparta-test-app/app`

11.  Ensure that the app is running in the background and can be ran multiple times with no errors.
`nohup node app.js` or `nohup node app.js &`
