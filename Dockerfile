FROM clojure:temurin-18-tools-deps-alpine

# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

# Install leiningen
RUN apk add --update --no-cache leiningen

# Install Reviewdog
ENV REVIEWDOG_VERSION=v0.14.1

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

RUN apk --no-cache add gcc ncurses-dev libc-dev readline-dev make \
    && cd /tmp \
    && wget https://github.com/hanslub42/rlwrap/releases/download/v0.43/rlwrap-0.43.tar.gz \
    && tar -xzvf rlwrap-0.43.tar.gz \
    && cd rlwrap-0.43 \
    && ./configure \
    && make install \
    && rm -rf rlwrap-0.43 \
    && apk del gcc ncurses-dev libc-dev readline-dev make

COPY eastwood.sh /eastwood.sh
COPY parse_lines.py /parse_lines.py

ENTRYPOINT ["bash", "/eastwood.sh"]
