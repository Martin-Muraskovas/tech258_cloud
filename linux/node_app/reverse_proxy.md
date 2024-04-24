sudo DEBIAN_FRONTEND=noninteractive apt update -y

sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y

#backup file
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bk

sudo sed -i '51s/.*/\t        proxy_pass http:\/\/localhost:3000;/' /etc/nginx/sites-available/default

sudo systemctl restart nginx

sudo systemctl enable nginx

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo DEBIAN_FRONTEND=noninteractive -E bash - &&\
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

mkdir apps
cd apps

git clone https://github.com/Martin-Muraskovas/tech258-sparta-test-app.git

cd ~/apps/tech258-sparta-test-app/app

export DB_HOST=mongodb://172.31.50.217:27017/posts

sudo -E npm install

npm start
