FROM alpine:latest

RUN apk --update add perl bash
RUN adduser -D -h /treetagger -g treetagger treetagger

ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN echo "BUILD_PLATFORM=$BUILDPLATFORM, TARGET_PLATFORM=$TARGETPLATFORM"

ENV SOURCE https://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data

# Binary dependant part
# linux/amd64  => linux
# linux/arm64  => ARM64
# linux/arm/v7 => ARM32

COPY get_tt_binary.sh /bin

WORKDIR /treetagger

RUN get_tt_binary.sh $SOURCE $TARGETPLATFORM

ADD $SOURCE/install-tagger.sh /treetagger
ADD $SOURCE/tagger-scripts.tar.gz /treetagger
ADD $SOURCE/french.par.gz /treetagger
ADD $SOURCE/italian.par.gz /treetagger
ADD $SOURCE/english.par.gz /treetagger
ADD $SOURCE/spanish.par.gz /treetagger
ADD $SOURCE/german.par.gz /treetagger
ADD $SOURCE/french-chunker.par.gz /treetagger
ADD $SOURCE/english-chunker.par.gz /treetagger
ADD $SOURCE/german-chunker.par.gz /treetagger
ADD $SOURCE/spanish-chunker.par.gz /treetagger

RUN chown -R treetagger:treetagger /treetagger
RUN chmod u+x /treetagger/install-tagger.sh


USER treetagger:treetagger

RUN /treetagger/install-tagger.sh && chmod -R a+r /treetagger

ENV PATH $PATH:/treetagger/bin:/treetagger/cmd
