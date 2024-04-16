FROM www.7v1.net/steamcmd

# Install Night of the Dead
ENV APPDIR "${HOMEDIR}/notd"
RUN mkdir -p ${APPDIR} && chown steam:steam ${APPDIR} \
	&& ../steamcmd/steamcmd.sh +force_install_dir ${APPDIR} +login anonymous +app_update 1420710 validate +quit \
    && chown steam:steam ${APPDIR}

USER ${USER}
RUN winecfg
WORKDIR ${APPDIR}
CMD ["bash", "-c", "wine StartServer.bat"]
