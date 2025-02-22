In soanqube, we have quality profiles for each language and based these profiles, we see code smell, bugs etc in sonarqube report.
- there are defult rules by default quality gates but they dont tag pass or fail.
- hence we need to define our own quality gates rule.
  - create quality gate = "twitter-java-qg"
  - now i need to enable rules i.e conditions.
  - NEW CODE = this way it compare new code with last code.
  - OVERALL CODE = so on overall code
    - conditions 
      - bugs = 50 (bugs more than 50 means code fail).
      - code smell = 40 

# now we need to apply this quality gate to our project - 
- select project - click on project name.
- in project go to administration.
  - quality gates
    - choose our quality gate.
  - now our proect has that quality gate.

# now just build it again - 
- you will see quality gate pass or not.

# now we need to see the reponse and pass or fail jenkins job based on quality gates- 
- we need to add quality gate stage - 
- timout means once it send analyse report to sonarqube, how much time it should wait for status in jenkins 
- qg means wait for quality gates (wheather its success or failure)
- if quality gate staus not ok then pipeline fail.
  - stage("Quality Gate") {
    steps {
        script {
            timeout(time: 1, unit: 'HOURS') { // Just in case something goes wrong, pipeline will be aborted
                def qg = waitForQualityGate() // Reuse taskId previously collected by withSonarQubeEnv
                if (qg.status != 'OK') {
                    error "Pipeline aborted due to quality gate failure: ${qg.status}"
                }
            }
        }
    }
  }