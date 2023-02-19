# AutoSSH Docker container.
Docker container to setup a robust ssh tunnel using AutoSSH.














```
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
      - TUNNELHOST=143.47.243.39   # IP Address or hostname of host
      - TUNNELPORT=22
      - LOCALPORT=10001  # use between 10001-10100      
      - REMOTEHOST=localhost
      - REMOTEPORT=9999  # amend to the port of the remote service to tunnel to
      #
      - KEY=beast-1-amd_ed25519
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



