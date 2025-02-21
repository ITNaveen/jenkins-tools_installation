# steps - 
- create account in sonarqube
- generate token on sonarqube 
- create creds for token in jenkins
- plgin for sonarscanner
- configure sonarqube server
- add sonarqube scanner to jenkins as sonarqube scanner needs to run on client system.
- create sonarqube property files
- add this as stage to Jenkinsfile.

# sonarqube account, toke creation and addiding this in jenkins - 
- In Sonarqube profilepic - account - security - name the token
  - jenkins-token = 3652fe544dbef6ec7d1c785fb58bef0196467d79

- to jenkins now - manage - credetionals - add sonarqube creds - secret_text - name = sonar-cred

# now enable communication between sonar and jenkins - 
- install "sonar-qube- scanner" plugin
- configure this - system/global_tool_config
  - now we need to add name so this name will be used in jenkins pipeline.(sonarqube-server)
  - server url - https://sonarcloud.io/
  - server auth token , we already have done this part so just add that now.
  - save.

- sonarqube server is added now we need to add sonarqube scanner, so manage - tools - SonarQube Scanner installations
  name = sonar-scanner

# we need to write sonar property file - 
- get details - https://docs.sonarsource.com/sonarqube-server/10.1/analyzing-source-code/scanners/sonarscanner/
- create a file in root (where our source code is available) of project called "sonar-project.properties" 
- these property we need to configure as well. ---
...........
sonar.verbose=true  
sonar.organization=ITNaveen  
sonar.projectKey=itnaveen-key  
sonar.projectName=twittertrend  
sonar.language=java  
sonar.sourceEncoding=UTF-8  
sonar.sources=.  
sonar.java.binaries=target/classes  
sonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml  
..........

- first we need to create project in sonar - 
  - create org - ITNaveen - free_plan - create.
  - now in this org - create project - fill details up there.

# add sonarqube stage - 
withSonarQubeEnv is a sever name. (check from system)
tool name from tools.

