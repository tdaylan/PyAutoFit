#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" user

# the actions before login user
export HOME=/home/user
chown -R user:user $HOME

mv -n /home/user/workspace_temp/config /home/user/workspace
mv -n /home/user/workspace_temp/data /home/user/workspace
mv -n /home/user/workspace_temp/howtolens /home/user/workspace
rm -rf /home/user/workspace_temp

# login user
exec /usr/local/bin/gosu user "$@"
