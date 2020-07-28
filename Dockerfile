ARG JAVA_VERSION=8

FROM openjdk:$JAVA_VERSION

ARG WCT_VERSION=4.5.1
ARG WCT_ARCHIVE=wct-$WCT_VERSION.zip
ARG WCT_URL=https://www.ncdc.noaa.gov/wct/app/dist/wct-$WCT_VERSION.zip

RUN set -ex && apt update && apt install -y libxext6 libxrender1 libxtst6

WORKDIR /usr/src/myapp

RUN set -ex && if [ ! -f $WCT_ARCHIVE ]; then wget --output-document=$WCT_ARCHIVE $WCT_URL; fi \
    && unzip $WCT_ARCHIVE \
    && rm $WCT_ARCHIVE \
    && mv wct-* wct

COPY LICENSE README.md ./

CMD ["/bin/bash", "wct/wct-viewer"]
