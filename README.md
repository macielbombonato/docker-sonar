# Docker-Sonar  
  
## O que temos aqui?  
  
Esta é a versão da imagem oficial do Sonar incluíndo apenas os plugins abaixo:  
  
### Quality Profiles  
  
- Android
- Cobertura  
- C#  
- CSS  
- Findbugs
- Java  
  - Checkstyle  
  - PMD  
  - Properties files  
- Javascript  
- json  
- Kotlin  
- Objective-C (versão open source)  
- PHP  
- Python  
- Swift (versão open source)  
- Typescript  
- Web  
- XML  
  
### Outros plugins  
  
- SonarGraph  
- SVG Badges  
- Timeline  
- Score  
- SCM:  
  - git  
  - SVN  
  
  
## Como executar?  

### Na sua máquina local:

Basta executar o comando abaixo no diretório raiz deste repositório.  
  
> OBS.: Estou considerando que vc está em um ambiente unix.  
  
```
docker-compose up
```  
  
Depois de algum tempo, acesse a URL [http://localhost:9000](http://localhost:9000).  
  

### AWS -> Elastic Beanstalk:

Na Amazon, para criar uma máquina Elastic Beanstalk existem dois detalhes importantes:

1. Use o arquivo **Dockerrun.aws.json** que está dentro de ```tools/aws```;
2. As variáveis de ambiente (que estão abaixo no comentário) devem ser criadas e preenchidas na configuração do **EB** em **Software**. No final desta sessão temos o espaço para preencher as variáveis de ambiente (o que é preenchido aqui é acessível pelo container como variável de ambiente);

> #### Variáveis de ambiente utilizadas pelo sonar  
> SONARQUBE_JDBC_URL=jdbc:postgresql://YOUR-DATABASE-HOST:5432/sonar  
> SONARQUBE_JDBC_USERNAME=sonar  
> SONARQUBE_JDBC_PASSWORD=sonar  


### Em qualquer um desses ambientes:

O usuário e senha inicial são: **admin**  

Acesse pela primeira vez com ele para gerar a chave de acesso dos scripts que gerarão os relatórios.  

## Alterações na imagem?  

Caso tenha feito alguma alteração no Dockerfile ou incluido algum plugin, para criar a imagem nova execute o comando abaixo:  

```
./build-image.sh
```  
