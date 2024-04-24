# AWS EC2 2 tier app deployment using nginx and mongodb

## Prerequisites
Please follow part 1 of this [guide](https://github.com/Martin-Muraskovas/tech258_cloud/blob/main/readme.md).

Configure One EC2 insance for the app.
When you get to the security settings. Add a Custom TCP with the port 3000. Port 3000 is the default port for node.js applications.

Configure another EC2 instance for the Database.
When you get to the security settings. Add a Custom TCP with the port 27017. Port 27017 is the default port for mongodb.

## Configuring the Database.

1. Update packages.<br>
`sudo DEBIAN_FRONTEND=noninteractive apt update -y`

2. Upgrade packages.<br>
`sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y`

3. Install mongodb 7.0.6<br>
    ```
    sudo apt-get install gnupg curl
    curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
    sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
    --dearmor

    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

    sudo apt-get update

    sudo apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.2.4 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6
    ```

4. Configure the bind ip in the mongodb config file to 0.0.0.0.<br>
`sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/g' /etc/mongod.conf`

5. Restart mongodb<br>
`sudo systemctl restart mongod`

6. Enable mongodb<br>
`sudo systemctl enable mongod`


## Configuring the app

1. Update packages.<br>
`sudo DEBIAN_FRONTEND=noninteractive apt update -y`

2. Upgrade packages.<br>
`sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y`

3. Installing nginx.<br>
`sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y`

4. Restarting nginx.<br>
`sudo systemctl restart nginx`

5. Enabling nginx.<br>
`sudo systemctl enable nginx`

6. Install node version 20.<br>
`curl -fsSL https://deb.nodesource.com/setup_20.x | sudo DEBIAN_FRONTEND=noninteractive -E bash - &&\`
`sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs`

7. Check the node.js version.<br>
`node -v`

8. Create an apps folder and change into it.<br>
`mkdir apps`<br>
`cd apps`

9. Clone the folder containing the app.<br>
`git clone https://github.com/Martin-Muraskovas/tech258-sparta-test-app.git`

10. Change into the app folder.<br>
`cd ~/apps/tech258-sparta-test-app/app`

11. Set a DB_HOST environment variable<br>
`export DB_HOST=mongodb://<privateIPofDatabaseInstance>:27017/posts`

12. Install npm<br>
`sudo -E npm install`

13. Start the app<br>
`npm start`

## Configuring a reverse proxy
After installing nginx in the previous section. You may want to configure a reverse proxy to improve the user experience.

This can be done by doing the following:

1. Backup the existing nginx configuration file.
`sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bk`

2. Replace line 51 of the config file to set the reverse proxy as local host.
`sudo sed -i '51s/.*/\t        proxy_pass http:\/\/localhost:3000;/' /etc/nginx/sites-available/default`

### Potential Blockers during the reverse proxy set up.
During this set up of the reverse proxy, my initial research led to me altering the file on the following path:
<br>`/etc/nginx/sites-enabled/default`<br>
This was the incorrect path. Further research shows that the correct file path is:
<br>`/etc/nginx/sites-available/default`<br>