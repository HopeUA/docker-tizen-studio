FROM hope/java:8

ENV \
    TIZEN_VERSION=1.2 \
    TIZEN_HOME=/home/tizen/tizen-studio
ENV \
    TIZEN_INSTALLER=web-cli_Tizen_Studio_${TIZEN_VERSION}_ubuntu-64.bin

RUN \
    # Prepare user
    adduser -D tizen && \

    # Download
    cd /tmp && \
    wget http://download.tizen.org/sdk/Installer/tizen-studio_${TIZEN_VERSION}/${TIZEN_INSTALLER}  && \

    # Install
    chmod +x /tmp/${TIZEN_INSTALLER} && \
    su -c "/tmp/${TIZEN_INSTALLER} --accept-license ${TIZEN_HOME}" tizen && \

    # Cleanup
    rm -rf /tmp/*

ENTRYPOINT ["bash", "-c", "${TIZEN_HOME}/tools/ide/bin/tizen"]
