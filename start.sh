#!/bin/sh

# sshd wants permissions on dir with userkeys to be 0555
# but mounted secrets volume is always 0777. Permissions are
# enforced at the bindmount, but sshd doesn't know that.
# We create a new dir with right permissions and copy things
# through.
mkdir /etc/ssh/userkeys
chmod 0555 /etc/ssh/userkeys

cp /etc/ssh/userkeys.orig/* /etc/ssh/userkeys

exec "$@"