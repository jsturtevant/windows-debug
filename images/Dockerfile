ARG INSTALLER_VERSION="${latest}"
FROM ghcr.io/jsturtevant/debug-installer-cache:${INSTALLER_VERSION} as installer

FROM mcr.microsoft.com/oss/kubernetes/windows-host-process-containers-base-image:v0.1.0 AS runtime
WORKDIR /apps
ENV PATH="%CONTAINER_SANDBOX_MOUNT_POINT%\apps\vim;%CONTAINER_SANDBOX_MOUNT_POINT%\apps\sysinternals;C:\Windows\system32;C:\Windows"

COPY --from=installer /ProgramData/scoop/apps/vim/9.0 ./vim/
