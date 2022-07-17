param ($version='latest', $image='ghcr.io/jsturtevant/debug-installer-cache')

docker build  -t "${image}:${version}" -f Dockerfile.installer .