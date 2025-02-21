keepp the first job but configure - 
now we want to pull repo in pipeline , so again pipeline job and in script on jenkins - 
we mention first stage as cloning - 
- we need to add github creds for this first.

- 
pipeline {
    agent {
        node {
            label 'maven'
        }
    }
    
    stages {
        stage('clone-code') {
            steps {
                git branch: 'main', credentialsId: 'github-connect', url: 'https://github.com/ITNaveen/Jenkins--tweet-trend-new.git'
            }
        }
    }
}

# check the status in slave node - 
ubuntu@ip-10-1-1-31:~$ cd /home/ubuntu/jenkins/
ubuntu@ip-10-1-1-31:~/jenkins$ ls
remoting  remoting.jar  workspace
ubuntu@ip-10-1-1-31:~/jenkins$ cd workspace/
ubuntu@ip-10-1-1-31:~/jenkins/workspace$ ls
test-job  ttrend-job  ttrend-job@tmp
ubuntu@ip-10-1-1-31:~/jenkins/workspace$ cd ttrend-job
ubuntu@ip-10-1-1-31:~/jenkins/workspace/ttrend-job$ ls -la
total 28
drwxrwxr-x 4 ubuntu ubuntu 4096 Feb 21 07:05 .
drwxrwxr-x 5 ubuntu ubuntu 4096 Feb 21 07:05 ..
drwxrwxr-x 8 ubuntu ubuntu 4096 Feb 21 07:05 .git
-rw-rw-r-- 1 ubuntu ubuntu   11 Feb 21 07:05 .gitignore
-rw-rw-r-- 1 ubuntu ubuntu  233 Feb 21 07:05 README.md
-rw-rw-r-- 1 ubuntu ubuntu 3435 Feb 21 07:05 pom.xml
drwxrwxr-x 4 ubuntu ubuntu 4096 Feb 21 07:05 src
ubuntu@ip-10-1-1-31:~/jenkins/workspace/ttrend-job$ 