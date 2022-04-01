FROM ubuntu:bionic-20220315
RUN apt update
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa && apt update
RUN apt install -y python3.9 curl sudo python3.9-distutils
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.9 get-pip.py
RUN pip3.9 install awscli==1.22.84
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN npm install -g serverless@3.10.1
RUN npm install -g @aws-amplify/cli@7.6.26
WORKDIR /work
