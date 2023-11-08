FROM ubuntu:latest

# RUN apk --no-cache add curl
RUN apt update && apt upgrade -y

RUN apt install curl -y

RUN mkdir mcserver

WORKDIR "./mcserver"

RUN curl -JLO "https://api.modpacks.ch/public/modpack/97/6482/server/linux" && chmod +x serverinstall_97_6482

RUN ./serverinstall_97_6482 --auto

RUN chmod +x start.sh

RUN echo eula=true > eula.txt

ENTRYPOINT ["tail", "-f", "/dev/null"]
