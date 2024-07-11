
FROM ubuntu

WORKDIR /var/www/socket

# install node 20

RUN apt update && apt upgrade
RUN apt install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt install -y nodejs

# install curl + bun
# RUN apt update && apt upgrade
# RUN apt upgrade && apt install curl && apt install unzip
# RUN curl -fsSL https://bun.sh/install | bash
# RUN ~/.bun/bin/bun install uNetworking/uWebSockets.js#v20.33.0

RUN npm i --silent

CMD ["node","src/index.js"]
