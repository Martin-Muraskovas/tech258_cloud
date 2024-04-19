# Linux Commands Explained

## General Commands
`exit`
- This command is used to exit the current shell or terminal session.

`clear`
- It is used to clear the terminal screen by moving all previous commands and output out of view.

`whoami`
- It displays the username of the current user.

`history`
- It displays a list of previously executed commands.

`cat /etc/shells`
- This command displays the list of valid login shells on the system.

## `uname`
This command displays basic information about the operating system.
- Adding `--help` to uname (or many other commands) displays a help message or manual for that command, explaining its usage and options.

`uname -p` or `uname --processor`
- These commands show the processor type of the system.

`uname -n` or `uname --nodename`
- These commands display the network node hostname of the system.

`uname -a` or `uname --all`
- These commands display all available information about the system.


## `ps`
It shows a snapshot of the current processes running on the system.
`ps -p $$`
- This command shows information about the process with the process ID (PID) of the current shell.

`ps -p 1315`:
- This command displays information about the process with the specified PID.


## Interacting with *Files*

`file <filename>`
- It determines the file type of the specified file.

`mv <filename> <filename2>`
- It moves or renames files and directories.

`cp <filename> <filename2>`
- This command copies files and directories.

`rm <filename>`
- It removes or deletes a file.

`curl <source> --output <filename>`
- This command downloads a file from a specified source URL and saves it with the given filename.

`touch file.txt`
- It creates an empty file with the specified name.

`nano file.txt`
- This command opens the nano text editor to edit a file.

`cat file.txt`
- It displays the contents of a text file.

`head -2 file.txt`
- It displays the first 2 lines of a text file.

`tail -2 file.txt`
- It displays the last 2 lines of a text file.

`cat -n file.txt`
- This command displays the contents of a file with line numbers.

`grep "word" file.txt`
- It searches for a specific word in a file and displays the matching lines.


## Navigating and interacting with *Directories*

`ls`
- It lists files and directories in the current directory.
    - `ls -a`
        - This command lists all files including hidden files that start with a dot.

    - `ls -la`
        - This command lists all files and directories in long format, showing permissions and other details.

`mkdir <directory_name>`
- This command creates a new directory with the specified name.
    - `mkdir "space in name"` This command creates a directory with a space in its name.

`pwd`
- It shows the current working directory.


## Super User:

`sudo apt update -y`
- This command updates the package lists for upgrades.

`sudo apt install tree`
- It installs the tree command, which displays directory structures in a tree-like format.
    - Using `tree`
        - This command displays the directory structure in a tree-like format.

`sudo apt upgrade -y`
- This command upgrades all installed packages on the system.

`sudo su`
- It is used to switch to the root user in the terminal.

## Creating a Bash Script to install and launch nginx:

`nano provision.sh`
- Opens the nano text editor to create or edit a file named provision.sh.

```
# Shebang line specifying that the script should be executed using the Bash shell.
#!/bin/bash 

# update
sudo apt update -y

# upgrade
sudo apt upgrade -y

# install nginx
sudo apt install nginx -y

# restart nginx
sudo systemctl restart nginx

# enable nginx
sudo systemctl enable nginx
```

`./provision.sh`
- Executes the provision.sh script

`ll`
- Lists the files and directories in the current directory.

`chmod +x provision.sh`
- Changes the permissions of the provision.sh script to make it executable.

## Environment Variables

`printenv`
- Prints the current environment variables.

`MYNAME=martin`
- Assigns the value "martin" to the environment variable MYNAME.

`echo $MYNAME`
- Prints the value of the MYNAME environment variable.

`export MYNAME=martin`
- Exports the MYNAME variable to be accessible to child processes.

`nano .bashrc`
- Opens the .bashrc file in the nano text editor for editing. The .bashrc file is a script that is executed whenever a new terminal session is started.
