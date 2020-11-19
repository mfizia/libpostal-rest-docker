FROM ubuntu:20.04

ARG COMMIT
ENV COMMIT ${COMMIT:-master}
ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y \
    autoconf automake build-essential curl git libsnappy-dev libtool pkg-config
RUN git clone https://github.com/openvenues/libpostal -b $COMMIT

COPY ./*.sh /libpostal/

WORKDIR /libpostal
RUN ./build_libpostal.sh
RUN ./build_libpostal_rest.sh

#CLEANUP
RUN apt -y clean

EXPOSE 8080

USER nobody

CMD /libpostal/workspace/bin/libpostal-rest
