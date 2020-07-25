#!/bin/bash

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
port="8505"
username=$JUPYTERHUB_USER
delim='='

echo "$JUPYTERHUB_USER"

for var in "$@"
  do

    splitarg=${var%%$delim*}

      if [ "$splitarg" == "--port" ]; then
        # Yes, port was given in one arg e.g. --port=8888

         port=${var#*$delim}
        echo "Setting external port $port"
      fi
done

sed -e "s/\${serverport}/$port/" -e "s/\${broadport}/10000/" -e "s/\${user_name}/$username/" /usr/local/etc/template_nginx.conf > /etc/nginx/nginx.conf

/usr/sbin/nginx -c /etc/nginx/nginx.conf -g 'daemon off;'
