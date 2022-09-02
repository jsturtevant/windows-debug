ARG INSTALLER_VERSION="${latest}"
FROM ghcr.io/jsturtevant/debug-installer-cache:${INSTALLER_VERSION} as installer

FROM ghcr.io/marosset/host-process-scratch-image:latest AS runtime
WORKDIR /apps
ENV PATH="%CONTAINER_SANDBOX_MOUNT_POINT%\apps\vim;%CONTAINER_SANDBOX_MOUNT_POINT%\apps\sysinternals;C:\Windows\system32;C:\Windows"

COPY --from=installer /ProgramData/scoop/apps/vim/9.0 ./vim/

WORKDIR /debug
COPY ./ContainerPlatform.wprp .
COPY --from=installer /debug/net ./net
