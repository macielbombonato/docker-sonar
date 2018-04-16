# Docker-Sonar

## O que temos aqui? 

Esta é a versão da imagem oficial do Sonar incluíndo apenas as os plugins abaixo:
  
### Quality Profiles  

- Cobertura  
- C#  
- FLEX  
- Java  
- Javascript  
- PHP  
- Python  
- Typescript  
- Web  
- XML  
  
### Outros plugins  
  
- SonarGraph  
- Timeline  
- SCM:  
  - git  
  - SVN  


## Como executar?

Basta executar o comando abaixo do diretório raiz da aplicação (estou considerando que vc está em um ambiente unix).

```
docker-compose up
```

Depois de algum tempo, acesse a URL [http://localhost:9000](http://localhost:9000).

O usuário e senha são: admin

Acesse pela primeira vez com ele para gerar a chave de acesso para enviar os relatórios para esta instancia.