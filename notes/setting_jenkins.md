# jenkins installation - 
- first create a ansible dir then file "hosts" and fill that up - 
[jenkins-master]
10.1.1.202

[jenkins-master:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/opt/RS_key.pem

[jenkins-slave]
10.1.1.31

[jenkins-slave:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/opt/RS_key.pem

# java and jenkins installation - 
---
- hosts: jenkins-master
  become: true

  tasks:
  - name: add jenkins key
    apt_key: 
      url: https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
      state: present
  
  - name: add jenkins repo
    apt_repository:
      repo: 'deb https://pkg.jenkins.io/debian-stable binary/'
      state: present 

  - name: install java
    apt: 
      name: openjdk-17-jre
      state: present
      update_cache: yes # means apt update
  
  - name: install jenkins
    apt: 
      name: jenkins
      state: present
    
  - name: start jenkins service 
    service:
      name: jenkins
      state: started

  - name: enable jenkins as well
    service: 
      name: jenkins
      enabled: yes

# now moved this yaml file to ansible server under /opt/

- then fire - ansible-playbook -i hosts jenkins-master-server.yaml

- jenkins is up now.
