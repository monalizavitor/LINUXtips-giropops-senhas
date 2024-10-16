# Desafio PICK LINUXtips
Criando uma imagem de container distroless e sem vulnerabilidades para a aplicação Giropops Senhas.

## O que é uma imagem distroless?
Imagens distroless são imagens Docker mínimas, que contêm apenas os componentes essenciais para executar uma aplicação específica. 

## Por que usar imagens distroless?
- **Segurança**: Menor superfície de ataque, pois não há componentes extras que possam ser explorados por vulnerabilidades.
- **Tamanho**: Imagens menores, o que agiliza o processo de build, push e pull.
- **Performance**: Menor tempo de inicialização e menor consumo de recursos.
- **Foco na aplicação**: Permite que você se concentre apenas na sua aplicação, sem se preocupar com a infraestrutura subjacente.

## Como executar?
A aplicação roda em um container com Flask e o Redis em outro, então precisamos criar uma rede entre eles e exportar uma variável de ambiente para se conectar com Redis.

Criando a rede
`docker network create -d bridge [nome-da-rede]`

Associando a rede ao container do redis
`docker container run -d --network [nome-da-rede-criada] redis:7.2.6`

Associando a rede ao container da aplicação
``docker container run -d -p 5000:5000 --env REDIS_HOST=[nome-do-conatiner-redis] --network [nome-da-rede-criada] [nome-da-imagem]``

## Distroless X Imagem base comum

O [Docker Scout](https://docs.docker.com/scout/) analisou as duas imagens para comparativo de vulnerabilidades e também podemos descatar outras informações: 

| Imagem | Imagem base | Vulnerabilidades | Camadas | Tamanho |
|---|---|---|---|---|
| [linuxtips-giropops-senhas-distroless:2.0](https://hub.docker.com/layers/dissipar/linuxtips-giropops-senhas-distroless/2.0/images/sha256-8518e704d95214d51bf343b96521b697d741d743c8c9d3922ede9655341d22a9?context=repo) |python:3.9-slim | 6 | 23 | 50.84 MB |
| [linuxtips-giropops-senhas:1.0](https://hub.docker.com/layers/dissipar/linuxtips-giropops-senhas/1.0/images/sha256-148def4674fe512a913a2be8602366181bbc36b882a22b66f24f3d4fe771ea15?context=repo) | chainguard/python:latest | 0 | 6 | 26.42 MB |

Imagem distroless assinada com o [Cosign](https://docs.sigstore.dev).
