#!/bin/bash

set -e

BUILD_DIR=/src
BUILD_CONFIGURATION=${BUILD_CONFIGURATION:-Release}

if [ -f ${BUILD_DIR}/dotnet-tools.json ] || [ -f ${BUILD_DIR}/.config/dotnet-tools.json ]; then
	dotnet tool restore
fi

if [ -z ${__NETCORE_CSPROJECTFILE:-} ]; then
	__NETCORE_CSPROJECTFILE=$(x=$(dirname $(find ${BUILD_DIR} -maxdepth 5 -iname Startup.cs -o -iname Program.cs | head -1)); while [[ "$x" =~ $BUILD_DIR ]] ; do find "$x" -maxdepth 1 -name *.csproj; x=`dirname "$x"`; done)
fi

if [ -z ${__NETCORE_CSPROJECTFILE:-} ]; then
	echo "Could not find a .csproj file.";
	exit 2;
fi

if [ -z ${__NETCORE_FINALDLLNAME:-} ]; then
	__NETCORE_FINALDLLNAME=$(basename ${__NETCORE_CSPROJECTFILE%.*})
fi

if [ -n "$(cat $PROJECT_FILE | grep 'netcoreapp2.0')" ]; then
	echo "======== WARNING ========"
	echo "We don't support netcoreapp2.0. You may need to upgrade your framework version."
fi

dotnet publish $__NETCORE_CSPROJECTFILE --output /app --configuration ${BUILD_CONFIGURATION}

echo "${__NETCORE_FINALDLLNAME}.dll" > /usr/local/app-name
