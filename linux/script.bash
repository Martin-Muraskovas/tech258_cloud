# Shebang line specifying that the script should be executed using the Bash shell.
#!/bin/bash 

echo updating...
sudo apt update -y
echo done!

echo upgrading packages...
sudo apt upgrade -y
echo done!

echo installing nginx...
sudo apt install nginx -y
echo done!

echo restarting nginx...
sudo systemctl restart nginx
echo done!

echo enabling nginx...
sudo systemctl enable nginx
echo done!

echo cd app folder

echo done

echo run app

echo done
