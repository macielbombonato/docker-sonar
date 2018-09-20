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
  
- SVG Badges  
- Timeline  
- Score  
- SCM:  
  - git  
  - SVN  
  
---
  
## Como executar?  

### Na sua máquina local:

Imaginando que o Docker já esteja instalado em sua máquina, basta executar o comando abaixo no diretório raiz deste repositório.  
  
```
docker-compose up
```  
  
Depois de algum tempo, acesse a URL [http://localhost:9000](http://localhost:9000).  
  

> Caso não tenha o Docker instalado na sua máquina, vale dar uma lida nessa documentação: [https://docs.docker.com/install/](https://docs.docker.com/install/).  

---
  
### AWS -> Elastic Beanstalk:

Na Amazon, para criar uma máquina Elastic Beanstalk existem dois detalhes importantes:

1. Use o arquivo **Dockerrun.aws.json** que está dentro de ```tools/aws```;
2. As variáveis de ambiente (que estão abaixo no comentário) devem ser criadas e preenchidas na configuração do **EB** em **Software**. No final desta sessão temos o espaço para preencher as variáveis de ambiente (o que é preenchido aqui é acessível pelo container como variável de ambiente);

> #### Variáveis de ambiente utilizadas pelo sonar  
> SONARQUBE_JDBC_URL=jdbc:postgresql://YOUR-DATABASE-HOST:5432/sonar  
> SONARQUBE_JDBC_USERNAME=sonar  
> SONARQUBE_JDBC_PASSWORD=sonar  
  
--- 
  
### Em qualquer um desses ambientes:

O usuário e senha inicial são: **admin**  

Acesse pela primeira vez com ele para gerar a chave de acesso dos scripts que gerarão os relatórios. 
  
---
  
## Alterações na imagem?  

Caso tenha feito alguma alteração no Dockerfile ou incluido algum plugin, para criar a imagem nova execute o comando abaixo:  

```
./build-image.sh
```

---

## Como publicar seus projetos no Sonar?

### Projetos Java + gradle  

1. Criar o arquivo ```gradle.properties```:
  
No diretório raiz do seu usuário deve existir uma pasta ```.gradle``` ... Incluir dentro dessa pasta o arquivo ```gradle.properties``` com o conteúdo abaixo.
  
```
systemProp.sonar.host.url=http://localhost:9000
systemProp.sonar.login=HASHGERADANOSONAR
```
  
Isso vai fazer o build da sua máquina apontar para o sonar que está local, para apontar para outra instancia do Sonar, basta alterar esses dados no arquivo de propriedades.

2. No arquivo ```build.gradle``` temos que incluir o seguinte:
   
```
apply plugin: 'jacoco'
apply plugin: 'org.sonarqube'
```
  
O jacoco monta o relatório de cobertura de testes.
Dentro de buildScript -> dependencies inclua o seguinte:

```
classpath "org.sonarsource.scanner.gradle:sonarqube-gradle-plugin:2.6.2"
```

3. Executar o build com envio do relatório.  

```
gradle build sonarqube
```
  
Vai gerar o relatório e enviar ele para o server do sonar. aí é só consultar em:
[http://localhost:9000/projects](http://localhost:9000/projects)

---

### Projetos NPM  
  
Dentro do diretório ```tools/scripts``` foi criado o script de exemplo **scanner-npm.sh**. 

Abra este arquivo e altere o valor das variáveis de ambiente no inicio dele para atender seus projetos. Após isso, basta executá-lo:

```
./scanner-npm.sh
```
  
> Para usuários Windows é necessário ter o terminal que emula linux (vem junto com o git).  
  
---
