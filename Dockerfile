FROM sonarqube:7.9.6-community

COPY plugins/** $SONARQUBE_HOME/extensions/plugins/

