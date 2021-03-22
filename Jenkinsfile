pipeline {
  agent none

  stages {
    
    stage('Plan') {
      agent { 
          kubernetes { 
              yamlFile "ci/pod.yaml" 
              } 
            }

      steps {
        container('terraform') {
            sh  '''
                export TF_IN_AUTOMATION=1

                terraform init
                terraform plan -out tf.plan
                ls ~/.aws/ && cat ~/.aws/credentials
                '''
            stash name: 'terraform-plan', includes: '.terraform/,tf.plan'
        }
      }
    }

    stage('Deploy to cloud') {
      agent { 
          kubernetes { 
              yamlFile "ci/pod.yaml" 
              } 
            }


      input {
          message "Deploy to cloud?"
      }

      steps {
          milestone(10)
          container('terraform') {
              unstash name: 'terraform-plan'
              sh    '''
                    export TF_IN_AUTOMATION=1
                    terraform apply tf.plan
                    '''
          }
      }
      when {
        beforeAgent true
        beforeInput true
        branch 'main'
      }
    }

  }
}
