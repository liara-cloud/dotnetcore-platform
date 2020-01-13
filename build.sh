set -ex;

docker build -t liararepo/dotnetcore-platform:builder -f Dockerfile.builder --build-arg DOTNETCORE_VERSION=3.1 .
docker build -t liararepo/dotnetcore-platform:runtime -f Dockerfile.runtime --build-arg DOTNETCORE_VERSION=3.1 .

docker build -t liararepo/dotnetcore-platform:builder -f Dockerfile.builder --build-arg DOTNETCORE_VERSION=3.0 .
docker build -t liararepo/dotnetcore-platform:runtime -f Dockerfile.runtime --build-arg DOTNETCORE_VERSION=3.0 .

docker build -t liararepo/dotnetcore-platform:builder -f Dockerfile.builder --build-arg DOTNETCORE_VERSION=2.2 .
docker build -t liararepo/dotnetcore-platform:runtime -f Dockerfile.runtime --build-arg DOTNETCORE_VERSION=2.2 .

docker build -t liararepo/dotnetcore-platform:builder -f Dockerfile.builder --build-arg DOTNETCORE_VERSION=2.1 .
docker build -t liararepo/dotnetcore-platform:runtime -f Dockerfile.runtime --build-arg DOTNETCORE_VERSION=2.1 .
