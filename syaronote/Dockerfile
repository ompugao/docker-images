FROM ompugao/golang-nodejs
MAINTAINER fujii.shohei@gmail.com

# install protobuf v3.0.0
RUN apt-get update && apt-get install -y --no-install-recommends git unzip autoconf automake libtool patch && rm -rf /var/lib/apt/lists/*
ADD autogen.sh.patch autogen.sh.patch
RUN mkdir 3rdparty && cd 3rdparty && git clone --depth 1 --branch v3.0.0 https://github.com/google/protobuf && cd protobuf && patch < ../../autogen.sh.patch && ./autogen.sh && ./configure && make && make install && ldconfig

RUN go get -u github.com/golang/protobuf/proto
RUN go get -u github.com/golang/protobuf/protoc-gen-go
RUN go get -d -u github.com/OUCC/SyaroNote/syaro
RUN cd $GOPATH/src/github.com/OUCC/SyaroNote/syaro/gitservice && protoc --go_out=plugins=grpc:. git.proto
RUN go build -ldflags "-X main.version=$(git describe)" -o /usr/bin/syaro github.com/OUCC/SyaroNote/syaro

RUN mkdir -p $GOPATH/src/github.com/OUCC/SyaroNote/build/public/js && cd $GOPATH/src/github.com/OUCC/SyaroNote/editorjs && mkdir build && npm install && npm run deploy
RUN cd $GOPATH/src/github.com/OUCC/SyaroNote && npm install && ./node_modules/bower/bin/bower install --allow-root && ./node_modules/gulp/bin/gulp.js copy

#RUN apt-get update && apt-get install -y --no-install-recommends pkg-config libgit2-dev && rm -rf /var/lib/apt/lists/*
#RUN go get -u github.com/libgit2/git2go && cd $GOPATH/src/github.com/libgit2/git2go && git submodule update --init && make install && go install
#RUN cd $GOPATH/src/github.com/OUCC/SyaroNote && go build -o build/gitplugin github.com/OUCC/SyaroNote/gitplugin

WORKDIR $GOPATH/src/github.com/OUCC/SyaroNote
ENV SYARODIR $GOPATH/src/github.com/OUCC/SyaroNote/build
CMD ["syaro"]

