ARG ARCH=
FROM alpine:latest

COPY start.sh /start.sh

ENV \
    AUTOSSH_PIDFILE=/autossh.pid \
    AUTOSSH_LOGFILE=/dev/stdout  \
    AUTOSSH_GATETIME=30           \
    AUTOSSH_POLL=120             \
    AUTOSSH_FIRST_POLL=60        \
    AUTOSSH_LOGLEVEL=7

# install SSH and delete the cached install files
RUN apk add --update autossh 
#openssh-client
RUN rm -rf /var/cache/apk/*;

# change permissions of script to allow execution
RUN chmod +x /start.sh

# Expose the ports that can be used for the local tunnels
EXPOSE 10001-10100

# run ssh command to start the tunnel
CMD /start.sh