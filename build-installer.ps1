param ($version='latest', $image='ghcr.io/jsturtevant/debug-installer')

docker build  -t "${image}:${version}" -f Dockerfile.installer .