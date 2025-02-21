# we need these in slave - 
- update the system
- install java
- download maven
- extract it 

- now we need to create slave set up file in anible, so jenkins-slave.
- in ansible server, in /opt/ make slave yaml and paste this.
---
- hosts: jenkins-slave
  become: true
  tasks:
  - name: update ubuntu repo
    apt:
      update_cache: yes   #apt update -y bascially.
      cache_valid_time: 3600  #If the cache is still fresh within this time, it won’t update again.

  - name: install java
    apt: 
      name: openjdk-17-jre
      state: present
      update_cache: yes # means apt update
  
  - name: download maven packages
    get_url:
      url: https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz   #this get downloaded in worker node.
      dest: /opt

  - name: extract maven packagesß
    unarchive:
      src: /opt/apache-maven-3.9.9-bin.tar.gz
      dest: /opt
      remote_src: yes  #since tar in worker then unarchives should be in worker and we are in ansible, so we need to tell that look for file in worker(remote).
  
  - name: Add Maven to path
    lineinfile:
      path: /etc/profile
      line: 'export PATH=/opt/apache-maven-3.9.9/bin:$PATH'
      state: present
- now in worker node in /opt we have maven.