FROM ubuntu:latest

LABEL maintainer='DSA'

#atualiza os pacotes e instala as dependencias
RUN apt-get update && apt-get install -y wget unzip curl

ENV TERRAFORM_VERSION=1.6.2

#Baixar e instalar terraform
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

#cria o diretorio lab1
RUN mkdir /lab1

#copia o arquivo terraform para dentro do container
#COPY main.tf /lab1/

#cria a pasta de downloads, baixa o aws cli e faz sua instalacao
RUN mkdir Downloads && \
    cd Downloads && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
        unzip awscliv2.zip && \
        ./aws/install

CMD ["/bin/bash"]