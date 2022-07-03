ARG VERSION="${v0.0.1}"
FROM ghcr.io/jsturtevant/debug-installer:${VERSION} as installer

FROM ghcr.io/marosset/host-process-scratch-image:latest AS runtime
WORKDIR /apps
ENV PATH="%CONTAINER_SANDBOX_MOUNT_POINT%\apps\vim;%CONTAINER_SANDBOX_MOUNT_POINT%\apps\sysinternals;C:\Windows\system32;C:\Windows"

COPY --from=installer /ProgramData/scoop/apps/vim/8.2.2824 ./vim/
