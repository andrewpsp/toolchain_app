--- a/Jenkinsfile
+++ b/Jenkinsfile
@@ -5,16 +5,32 @@
     /**
      * tools to auto-install and put on the PATH
      * some of the supported tools - maven, jdk, gradle
+     * Example:
+     * tools {
+     *     maven 'Maven363'
+     *     jdk 'OpenJDK11'
+     * }
      */
-
+    tools {
+        // Example: Ensure these tool names match your Jenkins Global Tool Configuration
+        // maven 'MyMavenInstallation'
+        // jdk 'MyJDKInstallation'
+    }
 
  /**
      * environment provides variables set in env variables or local variables
+     * Example:
+     * environment {
+     *     SONAR_HOST_URL = 'http://your-sonarqube-server:9000'
+     *     SONAR_LOGIN_TOKEN_CRED_ID = 'sonar-token-credentials-id'
+     *     ARTIFACTORY_SERVER_ID = "ARTIFACTORY_SERVER_EXAMPLE"
+     *     ARTIFACTORY_URL = "https://your.artifactory.url/artifactory"
+     *     ARTIFACTORY_CREDENTIALS_ID = "artifactory-credentials-id"
+     * }
      */
-
-
- /**
-     * stages contain one or more stage directives
-     */	
+    environment {
+        // Define any common environment variables here
+        // EXAMPLE_VAR = "example_value"
+    }
     stages {
         // Checkout Git reporitory 
         stage('Checkout Git') {
@@ -26,6 +42,7 @@
         // Build reporitory using Maven tool
         stage('Build') { 
             steps { 
+                // Consider removing -Dmaven.test.failure.ignore if you want the build to fail on test failures
                 sh "mvn -Dmaven.test.failure.ignore clean package"
             }
         }
@@ -34,7 +51,7 @@
         stage('Unit Test and Archive Results'){
             steps {
                 junit '**/target/surefire-reports/TEST-*.xml'
-     		    archive 'target/*.jar'
+     		    archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
             }
         }
 
@@ -45,12 +62,14 @@
                 stage('Automated Test Firefox'){
                     steps {
                     echo 'Automation Testing using Firefox browser...'
+                    // Add actual Firefox test execution commands here
                     }
                 }
                 //Automation Testing using Chrome browser
                 stage('Automated Test Chrome'){
                     steps {
                     echo 'Automation Testing using Chrome browser...'
+                    // Add actual Chrome test execution commands here
                     }
                 }
             }
@@ -61,28 +80,42 @@
 	    stage('Code Coverage analysis with Sonarqube') {
     	    steps {
                 echo 'Code Coverage analysis with Sonarqube...'
+                // Example: Requires SonarQube Scanner plugin and configuration
+                // script {
+                //    def scannerHome = tool 'SonarQubeScanner'; // Tool name from Jenkins Global Tool Configuration
+                //    withSonarQubeEnv(credentialsId: env.SONAR_LOGIN_TOKEN_CRED_ID, installationName: 'MySonarQubeServer') { // 'MySonarQubeServer' is SonarQube server config name in Jenkins
+                //        sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=your-project-key -Dsonar.sources=."
+                //    }
+                // }
             }
         }
 
         // SonarQube Quality Gate check	    
 	    stage ("SonarQube Quality Gate") {
-            steps {   
-                /*script {
-                    def qualitygate = waitForQualityGate()
-                    if (qualitygate.status != "OK") {
-                        error "Pipeline aborted due to quality gate coverage failure: ${qualitygate.status}"
+            steps {
+                echo 'Checking SonarQube Quality Gate...'
+                // Timeout is in minutes
+                // script {
+                //    timeout(time: 1, unit: 'HOURS') {
+                //        def qg = waitForQualityGate()
+                //        if (qg.status != 'OK') {
+                //            error "Pipeline aborted due to SonarQube Quality Gate failure: ${qg.status}"
+                //        } else {
+                //            echo "SonarQube Quality Gate passed: ${qg.status}"
+                //        }
                 //    }
-                }*/
-                bat 'echo SonarQube Quality Gate check...'
+                // }
             }
 	    }	
 
         // Artifactory configuration details
         stage ('Artifactory configuration') {
             steps {
-                /*
-                rtServer (
-                    id: "ARTIFACTORY_SERVER",
-                    url: SERVER_URL,
-                    credentialsId: CREDENTIALS
-                ) */
-                /*
-                rtMavenDeployer (
-                    id: "MAVEN_DEPLOYER",
-                    serverId: "ARTIFACTORY_SERVER",
-                    releaseRepo: "libs-release-local",
-                    snapshotRepo: "libs-snapshot-local"
-                )
-
-                rtMavenResolver (
-                    id: "MAVEN_RESOLVER",
-                    serverId: "ARTIFACTORY_SERVER",
-                    releaseRepo: "libs-release",
-                    snapshotRepo: "libs-snapshot"
-                )
-                */
+                echo "Artifactory configuration placeholder. Ensure Artifactory plugin is configured if used."
+                // Example using Artifactory Plugin:
+                // script {
+                //    rtServer (
+                //        id: env.ARTIFACTORY_SERVER_ID,
+                //        url: env.ARTIFACTORY_URL,
+                //        credentialsId: env.ARTIFACTORY_CREDENTIALS_ID
+                //    )
+                //
+                //    rtMavenDeployer (
+                //        id: "MAVEN_DEPLOYER",
+                //        serverId: env.ARTIFACTORY_SERVER_ID,
+                //        releaseRepo: "libs-release-local",
+                //        snapshotRepo: "libs-snapshot-local"
+                //    )
+                //
+                //    rtMavenResolver (
+                //        id: "MAVEN_RESOLVER",
+                //        serverId: env.ARTIFACTORY_SERVER_ID,
+                //        releaseRepo: "libs-release",
+                //        snapshotRepo: "libs-snapshot"
+                //    )
+                // }
             }
         }
 
-        // Execute Mavan & Publish Build Informations
-        stage ('Execute & Publish Build Info') {
+        // Execute Mavan & Publish Build Informations to Artifactory
+        stage ('Execute & Publish Build Info to Artifactory') {
             steps {
-                /*
-                rtMavenRun (
-                    tool: M3, // Tool name from Jenkins configuration
-                    pom: 'pom.xml',
-                    goals: 'clean install',
-                    deployerId: "MAVEN_DEPLOYER",
-                    resolverId: "MAVEN_RESOLVER"
-                )
-
-                rtPublishBuildInfo (
-                    serverId: "ARTIFACTORY_SERVER"
-                )
-                */
+                echo "Publishing build info to Artifactory placeholder."
+                // Example using Artifactory Plugin:
+                // script {
+                //    rtMavenRun (
+                //        tool: 'MyMavenInstallation', // Tool name from Jenkins Global Tool Configuration (matches 'tools' section)
+                //        pom: 'pom.xml',
+                //        goals: 'clean install -Dmaven.test.skip=true', // Skipping tests as they ran before
+                //        deployerId: "MAVEN_DEPLOYER", // Matches ID from Artifactory configuration stage
+                //        resolverId: "MAVEN_RESOLVER"  // Matches ID from Artifactory configuration stage
+                //    )
+                //
+                //    rtPublishBuildInfo (
+                //        serverId: env.ARTIFACTORY_SERVER_ID // Matches ID from Artifactory configuration stage
+                //    )
+                // }
             }
         }
 
         // Security Scanning (dynamic analysis using Burp Suite)
         stage('Security Scanning'){
             steps {
-                bat 'echo Security Scanning (dynamic analysis using Burp Suite)...'
+                // Assuming Node01 is Linux. If Windows is required, use a different agent or command.
+                sh 'echo Security Scanning (dynamic analysis using Burp Suite)...'
+                // Add actual security scanning commands here
             }
         }
 
         // Deploy code using Configuration Manager
         stage('Deploy'){
             steps {
-                bat 'echo Deploy code using Configuration Manager...'
+                // Assuming Node01 is Linux. If Windows is required, use a different agent or command.
+                sh 'echo Deploy code using Configuration Manager...'
+                // Add actual deployment commands here
             }
         }
     }

