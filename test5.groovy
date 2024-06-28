pipeline {
    agent {
        label "robot" // Run on an agent with Robot Framework installed
    }
    stages {
        stage("Checkout") {
             git 'https://github.com/aniwat3426/ttbspark_assignment.git'
            }    
        }
        stage("Run Test Automate") {
            steps {
                sh script: "robot -o report/ test4.robot", returnStatus: true
            }
        }
        stage("Send Result To Jenkins") {
            steps {
        script {
          step(
            [
              $class              : 'RobotPublisher',
              outputPath          : 'robot_reports',
              outputFileName      : "**/output.xml",
              reportFileName      : '**/report.html',
              logFileName         : '**/log.html',
              disableArchiveOutput: false,
              passThreshold       : "${env.ROBOT_PASS_THRESHOLD}" as double,
              unstableThreshold   : "${env.ROBOT_UNSTABLE_THRESHOLD}" as double,
              otherFiles          : "**/*.png,**/*.jpg",
            ]
          )
        }
    }
}