ARG DOTNETCORE_VERSION

FROM mcr.microsoft.com/dotnet/core/sdk:$DOTNETCORE_VERSION

WORKDIR /src

COPY builder.sh /usr/local/bin/builder.sh

ONBUILD COPY . .

ONBUILD RUN chmod +x /usr/local/bin/builder.sh && /usr/local/bin/builder.sh
