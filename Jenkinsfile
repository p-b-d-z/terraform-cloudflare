pipeline {
    agent { label 'aws' }
    options {
        withFolderProperties()
        buildDiscarder(logRotator(numToKeepStr: '42'))
    }
    environment {
        TF_BUCKET     = 'terraform-state'
        TF_CLI_ARGS   = '-no-color -json'
        TF_PLATFORM   = 'amd64'
        TF_VERSION    = '1.13.1'
        app_channel   = '#app-terraform-deploys'
        app_group     = 'terraform-cloudflare'
    }
    stages {
        stage('Terraform: Prepare') {
            when {
                anyOf {
                    changeset '**/*.tf'
                    changeset '**/*.tfvars'
                }
                branch 'master'
            }
            steps {
                script {
                    env.ACCOUNT_LIST = sh(
                        script: "find . -mindepth 1 -maxdepth 1 -type d ! -name '.*' -printf '%f,'",
                        returnStdout: true
                    ).trim()
                    sh """
                        wget -q https://releases.hashicorp.com/terraform/${env.TF_VERSION}/terraform_${env.TF_VERSION}_linux_${env.TF_PLATFORM}.zip
                        unzip -q -o terraform_${env.TF_VERSION}_linux_${env.TF_PLATFORM}.zip
                        AWS_DEFAULT_PROFILE=${env.AWS_DEFAULT_PROFILE} aws s3 ls ${env.TF_BUCKET}
                    """
                }
            }
        }
        stage('Terraform: Plan') {
            when {
                anyOf {
                    changeset '**/*.tf'
                    changeset '**/*.tfvars'
                }
                branch 'master'
            }
            steps {
                script {
                    def accountList = env.ACCOUNT_LIST.split(',').findAll { it }
                    for (account in accountList) {
                        withAWSParameterStore(
                            credentialsId: env.AWS_DEFAULT_PROFILE,
                            naming: 'basename',
                            path: "/all/cloudflare/${account}",
                            recursive: false,
                            regionName: "us-west-2"
                        ) {
                            script {
                                env.CLOUDFLARE_API_TOKEN = "${cloudflare_api_token}"
                                if (!env.CLOUDFLARE_API_TOKEN) {
                                    error("CLOUDFLARE_API_TOKEN missing for account ${account}")
                                }
                            }
                        }
                        script {
                            sh """
                                cp ./terraform ./${account}/terraform
                                cd ${account}
                                set +x
                                export TF_VAR_cloudflare_api_token=${env.CLOUDFLARE_API_TOKEN}
                                set -x
                                AWS_DEFAULT_PROFILE=${env.AWS_DEFAULT_PROFILE} ./terraform init > /dev/null
                                AWS_DEFAULT_PROFILE=${env.AWS_DEFAULT_PROFILE} ./terraform validate
                                AWS_DEFAULT_PROFILE=${env.AWS_DEFAULT_PROFILE} ./terraform plan -out current.plan -input=false > ../this.plan.log
                            """
                            sh '''
                                set +x
                                awk '{print}' this.plan.log | sed '1s/^/[/' | sed '$s/}$/}]/' | sed 's/}$/},/' > this.plan.json
                                jq '.[] | select(.type == "planned_change") | {action: .change.action, resource_type: .change.resource.resource_type, resource_name: .change.resource.resource_name}' this.plan.json
                                jq '.[] | select(.type == "change_summary")' this.plan.json
                                set -x
                            '''
                        }
                    }
                }
            }
        }
        stage('Terraform: Apply') {
            when {
                anyOf {
                    changeset '**/*.tf'
                    changeset '**/*.tfvars'
                }
                branch 'master'
            }
            steps {
                script {
                    def accountList = env.ACCOUNT_LIST.split(',').findAll { it }
                    for (account in accountList) {
                        withAWSParameterStore(
                            credentialsId: env.AWS_DEFAULT_PROFILE,
                            naming: 'basename',
                            path: "/all/cloudflare/${account}",
                            recursive: false,
                            regionName: "us-west-2"
                        ) {
                            script {
                                env.CLOUDFLARE_API_TOKEN = "${cloudflare_api_token}"
                                if (!env.CLOUDFLARE_API_TOKEN) {
                                    error("CLOUDFLARE_API_TOKEN missing for account ${account}")
                                }
                            }
                        }
                        script {
                            sh """
                                cp ./terraform ./${account}/terraform
                                cd ${account}
                                set +x
                                export TF_VAR_cloudflare_api_token=${env.CLOUDFLARE_API_TOKEN}
                                set -x
                                AWS_DEFAULT_PROFILE=${env.AWS_DEFAULT_PROFILE} ./terraform apply current.plan > ../this.apply.log
                            """
                            sh '''
                                set +x
                                awk '{print}' this.apply.log | sed '1s/^/[/' | sed '$s/}$/}]/' | sed 's/}$/},/' > this.apply.json
                                jq '.[] | select(.type == "change_summary") | {added: .changes.add, changed: .changes.change, imported: .changes.import, removed: .changes.remove}' this.apply.json
                                set -x
                            '''
                        }
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs(
                cleanWhenNotBuilt: true,
                deleteDirs: true,
                disableDeferredWipeout: true,
                notFailBuild: true,
                patterns: [
                    [pattern: '.gitignore', type: 'INCLUDE'],
                    [pattern: '.propsfile', type: 'EXCLUDE']
                ]
            )
        }
    }
}
