FROM alpine:3.11

ARG USERNAME=forwarder

RUN apk add --no-cache openssh

RUN adduser \
    --shell /sbin/nologin \
    --no-create-home \
    --disabled-password \
    $USERNAME

RUN sed -i s/^$USERNAME:!/"$USERNAME:*"/g /etc/shadow

COPY sshd_config /etc/ssh/sshd_config

EXPOSE 48300

COPY start.sh /usr/sbin/start.sh

ENTRYPOINT ["/usr/sbin/start.sh"]