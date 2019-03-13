/* Declarative pipeline must be enclosed within a pipeline block */
pipeline { 
    // agent section specifies where the entire Pipeline will execute in the Jenkins environment
    agent { label 'Node01' }
    /**
     * tools to auto-install and put on the PATH
     * some of the supported tools - maven, jdk, gradle
     */


 /**
     * environment provides variables set in env variables or local variables
     */


 /**
     * stages contain one or more stage directives
     */	
    stages {
        // Checkout Git reporitory 
        stage('Checkout Git') {
            steps {
                   git 'https://github.com/rakeshkumawat83/simple-maven-project-with-tests.git'
            }
        }

        // Build reporitory using Maven tool
        stage('Build') { 
            steps { 
                sh "mvn -Dmaven.test.failure.ignore clean package"
            }
        }

        // Unit Test using Junit and archive results for analysis
        stage('Unit Test and Archive Results'){
            steps {
                junit '**/target/surefire-reports/TEST-*.xml'
     		    archive 'target/*.jar'
            }
        }

        // Automation Testing using selenium or SOAPUI
        stage('Automation Test'){
            parallel {
                //Automation Testing using Firefox browser
                stage('Automated Test Firefox'){
                    steps {
                    echo 'Automation Testing using Firefox browser...'
                    }
                }
                //Automation Testing using Chrome browser
                stage('Automated Test Chrome'){
                    steps {
                    echo 'Automation Testing using Chrome browser...'
                    }
                }
            }
            
        }

        // Code Coverage analysis using Sonarqube scanner	            
	    stage('Code Coverage analysis with Sonarqube') {
    	    steps {
                echo 'Code Coverage analysis with Sonarqube...'
            }
        }

        // SonarQube Quality Gate check	    
	    stage ("SonarQube Quality Gate") {
            steps {   
                /*script {
                    def qualitygate = waitForQualityGate()
                    if (qualitygate.status != "OK") {
                        error "Pipeline aborted due to quality gate coverage failure: ${qualitygate.status}"
                    }
                }*/
                bat 'echo SonarQube Quality Gate check...'
            }
	    }	

        // Artifactory configuration details
        stage ('Artifactory configuration') {
            steps {
                /*
                rtServer (
                    id: "ARTIFACTORY_SERVER",
                    url: SERVER_URL,
                    credentialsId: CREDENTIALS
                ) */
                /*
                rtMavenDeployer (
                    id: "MAVEN_DEPLOYER",
                    serverId: "ARTIFACTORY_SERVER",
                    releaseRepo: "libs-release-local",
                    snapshotRepo: "libs-snapshot-local"
                )

                rtMavenResolver (
                    id: "MAVEN_RESOLVER",
                    serverId: "ARTIFACTORY_SERVER",
                    releaseRepo: "libs-release",
                    snapshotRepo: "libs-snapshot"
                )
                */
            }
        }

        // Execute Mavan & Publish Build Informations
        stage ('Execute & Publish Build Info') {
            steps {
                /*
                rtMavenRun (
                    tool: M3, // Tool name from Jenkins configuration
                    pom: 'pom.xml',
                    goals: 'clean install',
                    deployerId: "MAVEN_DEPLOYER",
                    resolverId: "MAVEN_RESOLVER"
                )

                rtPublishBuildInfo (
                    serverId: "ARTIFACTORY_SERVER"
                )
                */
            }
        }

        // Security Scanning (dynamic analysis using Burp Suite)
        stage('Security Scanning'){
            steps {
                bat 'echo Security Scanning (dynamic analysis using Burp Suite)...'
            }
        }

        // Deploy code using Configuration Manager
        stage('Deploy'){
            steps {
                bat 'echo Deploy code using Configuration Manager...'
            }
        }
    }
}