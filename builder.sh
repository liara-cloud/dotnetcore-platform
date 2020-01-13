#!/bin/bash

set -ex

BUILD_DIR=/src
BUILD_CONFIGURATION=${BUILD_CONFIGURATION:-Release}

if [ -f ${BUILD_DIR}/dotnet-tools.json ] || [ -f ${BUILD_DIR}/.config/dotnet-tools.json ]; then
	dotnet tool restore
fi

if [ -z ${__DOTNETCORE_PROJECT_FILE:-} ]; then
	__DOTNETCORE_PROJECT_FILE=$(x=$(dirname $(find ${BUILD_DIR} -maxdepth 5 -iname Startup.cs -o -iname Program.cs | head -1)); while [[ "$x" =~ $BUILD_DIR ]] ; do find "$x" -maxdepth 1 -name *.csproj; x=`dirname "$x"`; done)
fi
if [ -z ${__DOTNETCORE_PROJECT_NAME:-} ]; then
	__DOTNETCORE_PROJECT_NAME=$(basename ${__DOTNETCORE_PROJECT_FILE%.*})
fi
if [ -z ${__DOTNETCORE_PROJECT_NAME:-} ]; then
	echo "Could not find a .csproj file.";
	exit 2;
fi

dotnet publish $__DOTNETCORE_PROJECT_FILE --output /app --configuration ${BUILD_CONFIGURATION}

echo "${__DOTNETCORE_PROJECT_NAME}.dll" > /usr/local/app-name
