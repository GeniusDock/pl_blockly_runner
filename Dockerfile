FROM ruby:2.3-jessie

RUN apt-get purge -y locales && \
    echo 'locales locales/locales_to_be_generated    multiselect en_US.UTF-8 UTF-8' | debconf-set-selections && \
    echo 'locales locales/default_environment_locale select      en_US.UTF-8' | debconf-set-selections && \
    apt-get update && \
    apt-get install -y --force-yes --no-install-recommends locales && \
    rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://get.docker.com/ | sh
RUN apt-get install chromedriver -y --force-yes --no-install-recommends
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-linux64.tar.gz
RUN tar -xvzf geckodriver*
RUN chmod +x geckodriver
RUN export PATH=$PATH:/geckodriver


ENV RACK_ENV production

RUN mkdir -p /app
WORKDIR /app
COPY . /app


RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install
EXPOSE 3001

ENTRYPOINT ["/app/start-runner"]
