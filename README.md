# AutoSSH Docker container.
Docker container to setup a robust ssh tunnel using AutoSSH.

This image has only 100 ports exposed - 10000 to 100100. Having more ports exposed seemed to create a significant slow down in docker ps, portainer, and android docker apps when using multiple containers.

Example docker-compose file:












```yaml
version: '3'
services:
  autossh:
    image: autossh-tunnel # beastarman/autossh-tunnel
    container_name: autossh-tunnel
    ports:
      - 10001:10001
    volumes:

       - autossh-data:/data # point volume or path to location of ssh keys for the tunnel host
        #
    environment:
      - TUNNELUSER=ubuntu
      - TUNNELHOST=123.123.123.123   # IP Address or hostname of host
      - TUNNELPORT=22
      - LOCALPORT=10001  # use between 10001-10100      
      - REMOTEHOST=localhost
      - REMOTEPORT=12345  # amend to the port of the remote service to tunnel to
      #
      - KEY=keyfilename
      #
    restart: always
    networks:
       sshtunnel: 

networks:
  sshtunnel:
     external: true


volumes:
  autossh-data:
    external:true
```

To use the above docker-compose template a Docker network and volume need to be created, The volume mapping to the ssh key to authorize the connection to the Tunnel host.



