FROM opensuse/leap:15.0

ENV REFRESHED_AT="2018-08-30" \
    MYSQL_AUTOCONF=true \
    MYSQL_HOST="mysql" \
    MYSQL_PORT="3306" \
    MYSQL_USER="root" \
    MYSQL_PASS="root" \
    MYSQL_DB="pdns" \
    CAME_FROM="https://github.com/kalabiyau/docker-powerdns"

RUN zypper --non-interactive in pdns pdns-backend-mysql pdns-backend-remote mariadb-client
RUN mkdir -p /etc/pdns/conf.d

ADD schema.sql pdns.conf /etc/pdns/
ADD entrypoint.sh /

EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/entrypoint.sh"]
