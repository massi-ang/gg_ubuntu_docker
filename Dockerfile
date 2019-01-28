FROM ubuntu:16.04
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN curl https://d1onfpft10uf5o.cloudfront.net/greengrass-core/downloads/1.7.0/greengrass-linux-x86-64-1.7.0.tar.gz | tar xzf - -C /
RUN apt-get install -y openjdk-8-jre

RUN useradd -r ggc_user && groupadd -r ggc_group
COPY startup.sh /
RUN mv /usr/bin/nodejs /usr/bin/nodejs6.10
EXPOSE 8883
ENTRYPOINT ["/startup.sh"]
