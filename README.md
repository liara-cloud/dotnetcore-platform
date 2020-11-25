# .Net platform

Create a Dockerfile containing following 2 lines:
```
FROM liararepo/dotnetcore-platform:5.0-builder as builder
FROM liararepo/dotnetcore-platform:5.0-runtime
```

Then use `docker build` to create a production-ready docker image for your .Net app.

## Supported Versions

You can use the following versions in your `Dockerfile`:
- 5.0
- 3.1 **(LTS)**
- 3.0 (EOL)
- 2.2 (EOL)
- 2.1 **(LTS)**
