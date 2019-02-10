FROM ubuntu:18.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y vim \
	curl \
	openssh-server \
	ca-certificates \
	tzdata
#	sudo \
#	postfix
	
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
#	git \
#	ruby-dev bundler 
# bzip 
EXPOSE 22/tcp 80/tcp 443/tcp
WORKDIR /app
RUN curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
RUN apt-get install gitlab-ce && EXTERNAL_URL="http://0.0.0.0"
CMD /opt/gitlab/embedded/bin/runsvdir-start & && gitlab-ctl reconfigure && tail -f /dev/null






#RUN echo "gitlab_rails['gitlab_shell_ssh_port'] = 2222" >> gitlab.rb
#RUN echo "Port 2222" >> /etc/ssh/ssh_config
#"gitlab_rails['gitlab_shell_ssh_port'] = 2222" -->sets ssh port








# docker run  -it -p 32770:22/tcp -p 32769:80/tcp -p 32768:443/tcp   ubuntu:18.10
# sudo apt-get install -y postfix

# docker run --rm -it -p 32770:22/tcp -p 32769:80/tcp -p 32768:443/tcp   debian:9

# setting `external_url`
# configuration in /etc/gitlab/gitlab.rb file.
# sudo gitlab-ctl reconfigure
# 0.0.0.0:32770->22/tcp, 0.0.0.0:32769->80/tcp, 0.0.0.0:32768->443/tcp
## apt-get install -y curl openssh-server ca-certificates
# 
	
