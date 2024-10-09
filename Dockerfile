FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Instalar o Redis e configurá-lo para iniciar automaticamente
RUN apt-get update && \
    apt-get install -y redis && \
    rm -rf /var/lib/apt/lists/*
    
# Expor a porta do Flask e do Redis
EXPOSE 5000 6379

# Definir a variável de ambiente REDIS_HOST
ENV REDIS_HOST=localhost

# Comando para iniciar a aplicação Flask e o Redis
CMD ["sh", "-c", "redis-server & flask run --host=0.0.0.0"]

