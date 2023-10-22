set -e

#DIRECTORY TO PULL FILE
 
 if [[  "$PWD" =="~/Documents/vagrant/vms"]]; then
  else
  mkdir -p ~/Documents/vagrant/vms
  cd ~/Documents/vagrant/vms
  vagrant init ubuntu/focal64
  fi 


  