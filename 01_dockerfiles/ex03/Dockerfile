FROM ubuntu:18.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y vim \
	curl \
	openssh-server \
	ca-certificates \
	tzdata
#	sudo \
#	postfix
	
#RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
#	git \
#	ruby-dev bundler 
# bzip 

EXPOSE 1337/tcp 80/tcp 443/tcp
RUN curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
RUN apt-get install gitlab-ce
RUN echo "letsencrypt['enable'] = false" >> /etc/gitlab/gitlab.rb && echo "nginx['redirect_http_to_https_port'] = 80" >> /etc/gitlab/gitlab.rb && echo "nginx['redirect_http_to_https'] = true" >> /etc/gitlab/gitlab.rb && echo "gitlab_rails['gitlab_shell_ssh_port'] = 1337" >> /etc/gitlab/gitlab.rb
RUN sed -i 's/http\:\/\/gitlab\.example\.com/https\:\/\/0\.0\.0\.0/g' /etc/gitlab/gitlab.rb
RUN echo "Port 1337" >> /etc/ssh/sshd_config && service ssh restart
RUN mkdir -p /etc/gitlab/ssl && chmod 700 /etc/gitlab/ssl && openssl req -subj /C=GB/ST=London/L=London/O=FakeOrg/OU=GITLABINST/CN=lab.com -nodes -newkey rsa:2048 -keyout 0.0.0.0.key -out 0.0.0.0.csr && mv 0.0.0.0.csr /etc/gitlab/ssl/ && mv 0.0.0.0.key /etc/gitlab/ssl/
RUN cp -v /etc/gitlab/ssl/0.0.0.0.key /etc/gitlab/ssl/0.0.0.0.original && openssl rsa -in /etc/gitlab/ssl/0.0.0.0.original -out /etc/gitlab/ssl/0.0.0.0.key && rm -v /etc/gitlab/ssl/0.0.0.0.original && openssl x509 -req -days 1460 -in /etc/gitlab/ssl/0.0.0.0.csr -signkey /etc/gitlab/ssl/0.0.0.0.key -out /etc/gitlab/ssl/0.0.0.0.crt && rm -v /etc/gitlab/ssl/0.0.0.0.csr && chmod 600 /etc/gitlab/ssl/0.0.0.0.* 
CMD service ssh restart && (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && tail -f /dev/null


# if you use self generated ssl key, you can try this.
# git config --global http.sslVerify false


# docker run -it -p 22:1337/tcp -p 80:80/tcp -p 443:443/tcp <image>
# error
# docker start <container>
# sed -i 's|${http://gitlab\.example\.com}|${http://0\.0\.0\.0}|g' /etc/gitlab/gitlab.rb
#sed -i '' 's/http:\/\/gitlab\.example\.com/http:\/\/0\.0\.0\.0' /etc/gitlab/gitlab.rb

# nginx['redirect_http_to_https'] = true








#RUN echo "gitlab_rails['gitlab_shell_ssh_port'] = 1337" >> gitlab.rb
#RUN echo "Port 1337" >> /etc/ssh/ssh_config
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
	
