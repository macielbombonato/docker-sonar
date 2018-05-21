export SCANNER="/home/maciel/workspace/docker-sonar/tools/sonar-scanner-3.1.0.1141-linux/bin/sonar-scanner"

export DEV_HOME="/home/maciel/workspace"
export SONAR_KEY="SONAR-KEY"
export SONAR_URL="http://localhost:9000"

export exclusions="**/node_modules/**,test/**"
export testPath="test"
export testReport="coverage/lcov.info"
export compile_command="npm install"
export test_install_dependencies="npm install nyc"
export test_command="npm test"
export projectVersion=$(date +%y%m%d_%H%M)

declare -a npmApps=( \
    "pasta-app-1" \
    "pasta-app-2" \
)

npm config set strict-ssl false

echo "Checking folder ${DEV_HOME}"
if [ -d ${DEV_HOME} ]; then

    cd ${DEV_HOME}

    echo " *** Running report in all apps "
    for app in "${npmApps[@]}"
    do
        echo "."
        echo " |=======> ${app} <=======|"
        if [ -d ${app} ]; then
            cd ${app} 

            echo " |          BRANCH           |"
            git branch

            echo " |++++++++ COMPILING ++++++++|"
            ${compile_command}

            if [ -d ${testPath} ]; then
                echo " |------->  TESTING  <-------|"

                ${test_install_dependencies}

                ${test_command}

                echo " |######## SCANNING  ########|"
                ${SCANNER} -X \
                    -Dsonar.projectKey=${app} \
                    -Dsonar.projectVersion=${projectVersion} \
                    -Dsonar.exclusions=${exclusions} \
                    -Dsonar.sources=${DEV_HOME}/${app} \
                    -Dsonar.host.url=${SONAR_URL} \
                    -Dsonar.tests=${testPath} \
                    -Dsonar.javascript.lcov.reportPaths=${testReport} \
                    -Dsonar.login=${SONAR_KEY}
            else 
                echo " |xxxxxxxx SCANNING  xxxxxxxx|"
                ${SCANNER} -X \
                    -Dsonar.projectKey=${app} \
                    -Dsonar.projectVersion=${projectVersion} \
                    -Dsonar.exclusions=${exclusions} \
                    -Dsonar.sources=${DEV_HOME}/${app} \
                    -Dsonar.host.url=${SONAR_URL} \
                    -Dsonar.login=${SONAR_KEY}
            fi

            cd ..
        fi
    done
fi
