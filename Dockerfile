FROM ubuntu:20.04

# Atualize a lista de pacotes e instale as dependências necessárias
RUN apt-get update && \
    apt-get install -y python3 python3-pip xvfb python3-pytest-xvfb python3-pyvirtualdisplay python3-xvfbwrapper

# Instale o PySimpleGUI usando pip
RUN pip3 install PySimpleGUI

# Copie o script Python para o contêiner
COPY main.py /workspace/main.py

# Defina o diretório de trabalho
WORKDIR /workspace

# Comando para executar o script Python com Xvfb
CMD ["xvfb-run", "python3", "main.py"]