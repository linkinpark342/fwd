FROM centos:centos6
RUN yum install -y epel-release \
    && yum install -y nodejs npm \
    && yum clean all

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install
COPY . /usr/src/app
RUN cp /usr/src/app/docker/* /usr/src/app/
EXPOSE 80
CMD ["node", "fwd.js"]
