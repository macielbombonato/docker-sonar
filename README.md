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
  
Basta executar o comando abaixo no diretório raiz deste repositório.  
  
> OBS.: Estou considerando que vc está em um ambiente unix.  
  
```
docker-compose up
```  
  
Depois de algum tempo, acesse a URL [http://localhost:9000](http://localhost:9000).  
  
O usuário e senha são: **admin**  

Acesse pela primeira vez com ele para gerar a chave de acesso dos scripts que gerarão os relatórios.  

## Alterações na imagem?  

Caso tenha feito alguma alteração no Dockerfile ou incluido algum plugin, para criar a imagem nova execute o comando abaixo:  

```
./build-image.sh
```  

