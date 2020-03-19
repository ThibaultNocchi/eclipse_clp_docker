FROM alpine

RUN apk update
RUN apk add build-base readline-dev ncurses-dev

WORKDIR /root
RUN wget https://github.com/hanslub42/rlwrap/releases/download/v0.43/rlwrap-0.43.tar.gz
RUN tar -xzvf rlwrap-0.43.tar.gz
RUN ls
WORKDIR /root/rlwrap-0.43
RUN ./configure && make install

WORKDIR /root
RUN rm -rf rlwrap-0.43 rlwrap-0.43.tar.gz
RUN wget https://eclipseclp.org/Distribution/Builds/7.0_54/src/eclipse_src.tgz
RUN tar -xzvf eclipse_src.tgz
WORKDIR /root/Eclipse_7.0_54
ENV ECLIPSEARCH x86_64_linux
RUN ./configure
RUN make -f Makefile.$ECLIPSEARCH; exit 0

WORKDIR /root
RUN rm eclipse_src.tgz
RUN apk del build-base ncurses-dev
RUN echo "alias eclipse=\"rlwrap /root/Eclipse_7.0_54/bin/x86_64_linux/eclipse\"" >> /etc/profile

WORKDIR /code
CMD [ "sh", "-l" ]
