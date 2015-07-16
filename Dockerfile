FROM phusion/baseimage

CMD ["/sbin/my_init"]

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y python-software-properties software-properties-common python-netaddr python-augeas python-pip git sudo vim uuid-runtime
RUN add-apt-repository --yes ppa:ansible/ansible
RUN apt-get update
RUN apt-get install -y ansible
RUN pip install debops
RUN adduser --disabled-password --gecos "" ubuntu
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN su ubuntu -c debops-update
RUN apt-get install -y curl unzip
RUN curl -O -L https://dl.bintray.com/mitchellh/packer/packer_0.8.1_linux_amd64.zip && unzip packer_0.8.1_linux_amd64.zip -d /usr/bin/ && rm packer_0.8.1_linux_amd64.zip
RUN curl -O -L https://dl.bintray.com/mitchellh/terraform/terraform_0.6.0_linux_amd64.zip && unzip terraform_0.6.0_linux_amd64.zip -d /usr/bin/ && rm terraform_0.6.0_linux_amd64.zip
RUN su ubuntu -c "echo 'export TERM=xterm-256color' >> ~/.bashrc"
RUN add-apt-repository --yes ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -y ruby2.2 ruby2.2-dev build-essential libxml2-dev zlib1g-dev libpq-dev libsqlite3-dev
RUN gem install bundler
