# steps - 
# sonarqube account, toke creation and addiding this in jenkins - "jenkins-token"
- In Sonarqube profilepic - account - security - name the token
  - jenkins-token = "cc80ff5a02fccd1d13237f217b1ce7ed26e94cfc"
  - this token is created in sonarcloud.io now.

# add this cred in Jenkins - "sonar-cred"
- to jenkins now - manage - credetionals - 
stored scoped to jenkins - system - global_creds - add_creds - secret_text - secret (paste jenkins-token here).
name = sonar-cred

# now enable communication between sonar and jenkins - 
- install "sonar-qube-scanner" plugin 
- once plugin has installed then add sonarqube server.
-to add sonarqube server - configure this - system/global_tool_config - sonarqube installations 
  - now we need to add name so this name will be used in jenkins pipeline.(sonarqube-server)
  - server url - https://sonarcloud.io/
  - server auth token , we already have done this part so just add that now.
  - save.

# sonarqube server is added now we need to add sonarqube scanner - "sonar-scanner"
- manage jenkins - tools - SonarQube Scanner installations
  name = sonar-scanner

# we need to write sonar property file - 
- get details - https://docs.sonarsource.com/sonarqube-server/10.1/analyzing-source-code/scanners/sonarscanner/
- create a file in root (where our source code is available) of project called "sonar-project.properties" 

- i have created - 
sonar org - ITNaveen
      key - itnaveen-key
Then create organisation.

- analyse a new project - 
project name (display name under analyse projects) = twitter
project key will be created automatically = itnaveen-key_twitter

- these property we need to configure as well. ---
...........
sonar.verbose=true  
sonar.organization=itnaveen-key    #organisation key needs to given not name.  
sonar.projectKey=itnaveen-key_twitter  
sonar.projectName=twitter 
sonar.language=java  
sonar.sourceEncoding=UTF-8  
sonar.sources=source-code
sonar.java.binaries=source-code/target/classes  
sonar.coverage.jacoco.xmlReportPaths=source-code/target/site/jacoco/jacoco.xml  
..........

# add sonarqube stage - 
withSonarQubeEnv is a sever name. (check from system)
tool name from tools.

