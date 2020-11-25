set -ex;

docker push liararepo/dotnetcore-platform:5.0-builder
docker push liararepo/dotnetcore-platform:5.0-runtime

docker push liararepo/dotnetcore-platform:3.1-builder
docker push liararepo/dotnetcore-platform:3.1-runtime

# docker push liararepo/dotnetcore-platform:3.0-builder
# docker push liararepo/dotnetcore-platform:3.0-runtime

# docker push liararepo/dotnetcore-platform:2.2-builder
# docker push liararepo/dotnetcore-platform:2.2-runtime

docker push liararepo/dotnetcore-platform:2.1-builder
docker push liararepo/dotnetcore-platform:2.1-runtime
