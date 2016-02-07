FROM alpine:latest

RUN apk --update add perl
RUN adduser -D -h /treetagger -g treetagger treetagger

ENV SOURCE http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data

ADD $SOURCE/install-tagger.sh /treetagger
ADD $SOURCE/tree-tagger-linux-3.2.tar.gz /treetagger
ADD $SOURCE/tagger-scripts.tar.gz /treetagger
ADD $SOURCE/french-par-linux-3.2-utf8.bin.gz /treetagger
ADD $SOURCE/italian-par-linux-3.2-utf8.bin.gz /treetagger
ADD $SOURCE/english-par-linux-3.2-utf8.bin.gz /treetagger
ADD $SOURCE/spanish-par-linux-3.2-utf8.bin.gz /treetagger
ADD $SOURCE/german-par-linux-3.2-utf8.bin.gz /treetagger
ADD $SOURCE/french-chunker-par-linux-3.2-utf8.bin.gz /treetagger
ADD $SOURCE/english-chunker-par-linux-3.2-utf8.bin.gz /treetagger
ADD $SOURCE/german-chunker-par-linux-3.2-utf8.bin.gz /treetagger
ADD $SOURCE/spanish-chunker-par-linux-3.2-utf8.bin.gz /treetagger

RUN chown -R treetagger:treetagger /treetagger
RUN chmod u+x /treetagger/install-tagger.sh

WORKDIR /treetagger

USER treetagger:treetagger

RUN /treetagger/install-tagger.sh

ENV PATH $PATH:/treetagger/bin:/treetagger/cmd
