pipeline {
  agent {
    docker {
      image "bryandollery/terraform-packer-aws-alpine"
      args "-u root"
    }
  }
  environment {
    CREDS = credentials('Raghadq-cred')
    AWS_ACCESS_KEY_ID = "$CREDS_USR"
    AWS_SECRET_ACCESS_KEY = "$CREDS_PSW"
    OWNER = 'bryan'
    PROJECT_NAME = 'web-server'
  }
  stages {
    stage("build") {
      packer build packer.json
    }
  }
}
