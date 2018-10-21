FROM ruby:2.3-jessie
MAINTAINER Agustin Pina

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_NAME en_US.UTF-8
ENV LC_IDENTIFICATION en_US.UTF-8
ENV LC_PAPER en_US.UTF-8
ENV LC_ADDRESS en_US.UTF-8
ENV LC_TIME en_US.UTF-8
ENV LC_NUMERIC en_US.UTF-8
ENV LC_MONETARY en_US.UTF-8
ENV LC_TELEPHONE en_US.UTF-8
ENV LC_MEASUREMENT en_US.UTF-8

RUN apt-get purge -y locales && \
    echo 'locales locales/locales_to_be_generated    multiselect en_US.UTF-8 UTF-8' | debconf-set-selections && \
    echo 'locales locales/default_environment_locale select      en_US.UTF-8' | debconf-set-selections && \
    apt-get update && \
    apt-get install -y --force-yes --no-install-recommends locales && \
    apt-get install unzip -y --force-yes && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt -y install libgconf2-4

RUN apt-get  install -y  xvfb
RUN wget -qO- https://get.docker.com/ | sh

# Install Chrome for Selenium
RUN curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /chrome.deb
RUN dpkg -i /chrome.deb || apt-get install -yf
RUN rm /chrome.deb

RUN wget -N http://chromedriver.storage.googleapis.com/2.42/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN chmod +x chromedriver
RUN mv -f chromedriver /usr/local/share/chromedriver
RUN ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
RUN ln -s /usr/local/share/chromedriver /usr/bin/chromedriver


ENV RACK_ENV production

RUN mkdir -p /app
WORKDIR /app
COPY . /app

COPY docker/start-runner /usr/local/bin/start-runner


RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install
EXPOSE 4567

ENTRYPOINT ["/usr/local/bin/start-runner"]