FROM ubuntu:latest

LABEL mantainer='DSA'

#autaliza e faz download dos pacotes
RUN apt-get update && \
    apt-get install -y wget unzip curl openssh-client iputils-ping

ENV TERRAFORM_VERSION=1.6.4

#baixa terraform, descompacta e move para a pasta bin do container
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

#cria a pasta e mapeia ela como volume
RUN mkdir /lab3
VOLUME /lab3

RUN mkdir Downloads && \
    cd Downloads && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

CMD ["/bin/bash"]