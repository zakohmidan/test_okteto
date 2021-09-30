FROM quay.io/miziri03/00m0

ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901 \
    SSH_PORT=22 \
    SUPER_VISOR__PORT=9001 \
    DEBIAN_FRONTEND=noninteractive
###########################################################################
ENV HOME=/headless \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    INST_SCRIPTS=/headless/install \
    NO_VNC_HOME=/usr/share/novnc \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1360x768 \
    VNC_PW=vncpassword \
    VNC_VIEW_ONLY=false
### Envrionment config




COPY ./starting/vnc_startup.sh "${STARTUPDIR}"/
RUN chmod 755 -R "${STARTUPDIR}"





EXPOSE $VNC_PORT $NO_VNC_PORT $SSH_PORT $SUPER_VISOR__PORT
USER 0
#CMD ["/usr/sbin/sshd","-D"]
#ENTRYPOINT [ "/usr/bin/tini", "--", "/dockerstartup/startup.sh" ]
CMD ["/bin/bash", "/dockerstartup/vnc_0_startup.sh"]
