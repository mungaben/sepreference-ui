# FROM ubuntu:20.04 as build

# LABEL maintainer="SDF Ops Team <ops@stellar.org>"

# RUN mkdir -p /app
# WORKDIR /app

# ENV DEBIAN_FRONTEND=noninteractive
# RUN apt-get update && apt-get install --no-install-recommends -y gpg curl git make ca-certificates apt-transport-https && \
#     curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key|gpg --dearmor >/etc/apt/trusted.gpg.d/nodesource.gpg && \
#     echo "deb https://deb.nodesource.com/node_18.x focal main" | tee /etc/apt/sources.list.d/nodesource.list && \
#     curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |gpg --dearmor >/etc/apt/trusted.gpg.d/yarnpkg.gpg && \
#     echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
#     apt-get update && apt-get install -y nodejs yarn && apt-get clean


# COPY . /app/
# RUN yarn install
# RUN yarn build

# FROM nginx:1.17

# COPY --from=build /app/build/ /usr/share/nginx/html/
# COPY --from=build /app/nginx.conf /etc/nginx/conf.d/default.conf

# FROM ubuntu:20.04 as build

# LABEL maintainer="SDF Ops Team <ops@stellar.org>"

# RUN mkdir -p /app
# WORKDIR /app

# ENV DEBIAN_FRONTEND=noninteractive
# RUN apt-get update && apt-get upgrade -y
# RUN apt-get install --no-install-recommends -y&& gpg curl git make ca-certificates apt-transport-https
# RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
# RUN apt-get install -y nodejs
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# RUN apt-get update && apt-get install -y yarn

# COPY . /app/
# RUN yarn install
# RUN yarn build
# FROM nginx:1.17

# COPY --from=build /app/build/ /usr/share/nginx/html/
# COPY --from=build /app/nginx.conf /etc/nginx/conf.d/default.conf

FROM node:21-bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y gettext

COPY ./package.json /package.json

RUN npm install

WORKDIR /app

CMD ["webpack", "serve", "--open", "--config", "webpack.dev.js"]