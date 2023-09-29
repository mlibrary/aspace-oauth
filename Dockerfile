FROM jruby:9.2.20.1-jre11

ARG UNAME=app
ARG UID=1000
ARG GID=1000

LABEL maintainer="ssciolla@umich.edu"

RUN gem update --system 3.2.3

RUN groupadd -g ${GID} -o ${UNAME}
RUN useradd -m -d /app -u ${UID} -g ${GID} -o -s /bin/bash ${UNAME}
RUN mkdir -p /gems && chown ${UID}:${GID} /gems

USER $UNAME

ENV BUNDLE_PATH /gems

WORKDIR /app

COPY --chown=${UID}:${GID} . /app

RUN bundle install

CMD ["tail", "-f", "/dev/null"]
