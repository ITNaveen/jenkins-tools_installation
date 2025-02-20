# pom.xml (Project Object Model) is the configuration file for Apache Maven. It defines:
✅ Project dependencies (libraries your project needs)
✅ Build plugins (tools to compile, package, test, etc.)
✅ Project metadata (name, version, description, etc.)
✅ Build lifecycle (compile, test, package, install, deploy)

# video 34 has all explanation about source code.

# we need to connect master with slave node - 
- ADD credentials - these credentials are needed to login to slave from master.
- add node - then we need to add slave node to jenkins master.

# change jenkins password - 
top right user name - admin - open scroll down - security.

# to add creds - 
manage - credentials - store scoped to jenkins - system - global credetials - add creds 
ssh username and private key - id=maven-server-creds - username=ubunut - private_key 

# now add slave to the master - 
In jenkins master - manage - nodes - new_node - name anything - description - 
remote_root_dir = /home/ubuntu/jenkins (automatically created) - launch_method - via_ssh 
host = private ip of slave - credentials= sleect maven keys we just created.
host key ver strategy = non verifying veri strategy.
check if its connected or not.