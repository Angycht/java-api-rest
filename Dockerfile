FROM openjdk:11
COPY api/target/api.jar /api.jar
WORKDIR /usr/app
EXPOSE 8080
FROM jenkins/jenkins:lts
USER root

# Instalar dependencias
RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

# Agregar repositorio oficial de Docker
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instalar Docker CE
RUN apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io

# Configurar permisos
RUN usermod -aG docker jenkins
USER jenkins
ENTRYPOINT  ["java", "-jar", "/api.jar"]