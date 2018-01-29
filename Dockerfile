FROM debian:9

RUN apt -qq update && env DEBIAN_FRONTEND=noninteractive apt install -y eatmydata \
    && env DEBIAN_FRONTEND=noninteractive eatmydata apt upgrade -y \
    && env DEBIAN_FRONTEND=noninteractive eatmydata apt install -y \
    ruby ruby-dev build-essential curl \
    && gem install fpm-cookery

COPY build-all.sh /build-all.sh
CMD ["/build-all.sh"]
