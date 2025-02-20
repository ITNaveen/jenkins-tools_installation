# we need to make one server as ansible server and then configure another 2 as jenkins master, jenkins worker.
- first we need to install ansible in 1st server, so steps are - 
  - install ansible
  - add inventory
  - copy private key on to ansible
  - test connection

- install ansible - 
  - first on server become root 
    - sudo su -
    - sudo apt update
    - sudo apt install software-properties-common
    - sudo add-apt-repository --yes --update ppa:ansible/ansible
    - sudo apt install ansible

- create invetory file - 
  - lets go to empty location like /opt and then create "hosts" file as this will be out inventory file.
  - now we need to add our jenkins-master and build-slave in this inventory file
    - take private ips as public will be keep changing and all 3 ec2s are in same VPC.
      - [jenkins-master]
        10.1.1.202

        [jenkins-master:vars]
        ansible_user=ubuntu
        anible_ssh_private_key_file=/opt/RS_key.pem   #we want to use key-pair based auth
    - now we need to have RS_key in /opt
      - scp -i  RS_key.pem RS_key.pem  ubuntu@54.236.154.149:/home/ubuntu
      - then move key to inside /opt/                                  
      - now change key mode to 400
      - ansible all -i hosts -m ping
      - all these steps from /opt/
    - add build sever as well.
      - [jenkins-master]
        10.1.1.202

        [jenkins-master:vars]
        ansible_user=ubuntu
        ansible_ssh_private_key_file=/opt/RS_key.pem

        [jenkins-slave]
        10.1.1.31

        [jenkins-slave:vars]
        ansible_user=ubuntu
        ansible_ssh_private_key_file=/opt/RS_key.pem
    - test again - ansible all -i hosts -m ping


