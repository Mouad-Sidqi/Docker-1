FROM debian:9

RUN apt-get update -y && apt-get install -y \
	bzip2 \
	ca-certificates \
	curl \
	apt-utils
WORKDIR /app
RUN curl -O https://files.teamspeak-services.com/releases/server/3.6.0/teamspeak3-server_linux_amd64-3.6.0.tar.bz2 && tar xf teamspeak3-server_linux_amd64-3.6.0.tar.bz2
EXPOSE 9987/udp 10011/tcp 30033/tcp
ENV TS3SERVER_LICENSE=accept
CMD sh teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh
#ENTRYPOINT curl -O https://files.teamspeak-services.com/releases/server/3.6.0/teamspeak3-server_linux_amd64-3.6.0.tar.bz2 && tar xf teamspeak3-server_linux_amd64-3.6.0.tar.bz2 && sh teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh 
#COPY . /home
#ENTRYPOINT sh home/teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh
## TS3 server creates a virtual voice server on port 9987 (UDP). The ServerQuery is listening on port 10011 (TCP) | file transfers will use port 30033 (TCP)
##        token=DQAXmGEzsR+02aRDIvcjVP3vmRAP12bV4EsK6zYV
##     loginname= "serveradmin", password= "wp9H4uuY"
#EXPOSE 9987/udp 10011/tcp 30033/tcp
## make the server an on-boot service
## && ln -s teamspeak3-server_linux_amd64/ts3server_startscript.sh /etc/init.d/teamspeak && service teamspeak start
# to containerize this image use the following command >> docker run --rm  -it -p 9987:9987/udp -p 10011:10011 -p 30033:30033 <image ID>
