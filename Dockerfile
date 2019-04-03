FROM sonarqube:7.7-community

ADD plugins/** /opt/sonarqube/extensions/plugins/
