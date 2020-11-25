ARG DOTNETCORE_VERSION

FROM mcr.microsoft.com/dotnet/sdk:$DOTNETCORE_VERSION

WORKDIR /src

# Install Node.js 12
RUN apt-get update && \
    apt-get install -y --no-install-recommends gnupg && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get update && \
    apt-get install -y --no-install-recommends nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends yarn && \
    # Upgrade npm
    npm install -g npm

COPY builder.sh /usr/local/bin/builder.sh

ONBUILD COPY . .

ONBUILD ARG __NETCORE_CSPROJECTFILE
ONBUILD ARG __NETCORE_FINALDLLNAME
ONBUILD ENV __NETCORE_CSPROJECTFILE=${__NETCORE_CSPROJECTFILE} \
  __NETCORE_FINALDLLNAME=${__NETCORE_FINALDLLNAME}

ONBUILD RUN chmod +x /usr/local/bin/builder.sh && /usr/local/bin/builder.sh
