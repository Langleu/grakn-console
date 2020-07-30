FROM alpine:3.12

ENV GRAKN_VER=1.8.0

WORKDIR /grakn

RUN apk update && \
    apk add openjdk8 bash && \
    wget https://github.com/graknlabs/grakn/releases/download/${GRAKN_VER}/grakn-core-all-linux-${GRAKN_VER}.tar.gz && \
    tar -xvf grakn-core-all-linux-${GRAKN_VER}.tar.gz --strip-components 2 && \
    rm -rf grakn-core-all-linux-${GRAKN_VER}.tar.gz README.md LICENSE server

ENTRYPOINT [ "./grakn" , "console" ]