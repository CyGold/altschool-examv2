this repo contains how to deploy laravel using LAMP stack with linux as the operating system that will host the application.
The master-slave.sh is used to automate the creation a master ans slave node on the virtual machine which will contain static ip adresses
the lamp.sh is used for the installation of our web server application which stands for the A in lamp stack, before installing MySQL which stands for the M then install php which stands for the P and also configure the php.ini file downloaded.
with the lamp.sh file, composer- a php dependency manager is installed, which will be needed to install the laravel dependencies and packages before configuration of our apache is done then installation of our laravel application and run the laravel permissions before setting up our database.
finally, with the lamp.sh file laravel is configured. all these is done the master node.
Asible-playbook directory contains the following files;
- inventory =holds the target machine ip address
- ansible-cfg =this is used to hold the configuration of ansible
- site.yaml = updates and upgrades the server after which it copies the cron job and changes the command of the file and runs the laravel script
files is a directory in the ansible-playbook folder that contains the laravel-slave.sh file.
laravel-slave.sh file installs the whole laravel application and the lamp stack and also deploys the application


###HOW TO RUN THE REPO###

.env file

