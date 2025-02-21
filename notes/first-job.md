ttrend-job - pipeline

pipeline script - 

pipeline {
    agent {
        node {
            label 'maven'   # slave node,s label
        }
    }
    
    stages {
        stage('Hello') {
            steps {
                echo 'Hello world'
            }
        }
    }
}

apply - save