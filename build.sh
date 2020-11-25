set -ex;

docker build -t liararepo/dotnetcore-platform:5.0-builder -f Dockerfile.builder --build-arg DOTNETCORE_VERSION=5.0 .
docker build -t liararepo/dotnetcore-platform:5.0-runtime -f Dockerfile.runtime --build-arg DOTNETCORE_VERSION=5.0 .

docker build -t liararepo/dotnetcore-platform:3.1-builder -f Dockerfile.builder --build-arg DOTNETCORE_VERSION=3.1 .
docker build -t liararepo/dotnetcore-platform:3.1-runtime -f Dockerfile.runtime --build-arg DOTNETCORE_VERSION=3.1 .

# This version is in EOL state and the new .Net 5 repo does not contain it.
# docker build -t liararepo/dotnetcore-platform:3.0-builder -f Dockerfile.builder --build-arg DOTNETCORE_VERSION=3.0 .
# docker build -t liararepo/dotnetcore-platform:3.0-runtime -f Dockerfile.runtime --build-arg DOTNETCORE_VERSION=3.0 .

# This version is in EOL state and the new .Net 5 repo does not contain it.
# docker build -t liararepo/dotnetcore-platform:2.2-builder -f Dockerfile.builder --build-arg DOTNETCORE_VERSION=2.2 .
# docker build -t liararepo/dotnetcore-platform:2.2-runtime -f Dockerfile.runtime --build-arg DOTNETCORE_VERSION=2.2 .

docker build -t liararepo/dotnetcore-platform:2.1-builder -f Dockerfile.builder --build-arg DOTNETCORE_VERSION=2.1 .
docker build -t liararepo/dotnetcore-platform:2.1-runtime -f Dockerfile.runtime --build-arg DOTNETCORE_VERSION=2.1 .
