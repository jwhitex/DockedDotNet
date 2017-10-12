#!/bin/sh
# WARNING: THIS IS NOOB SH

cur_dir=`pwd`

out_dir="../app"

# WARNING: DO NOT LEAVE CREDS HERE DURING COMMIT
# set here or in .bash_profile 
#DOCKEDDOTNET_DOMAIN
#DOCKEDDOTNET_REMOTE_USERNAME
#DOCKEDDOTNET_REMOTE_ADDRESS
#DOCKEDDOTNET_REMOTE_HOME

# remove out dir if it exists and recreate
if [ -d "$cur_dir/$out_dir" ]; then
  rm -r "$cur_dir/$out_dir"
else
  mkdir "$cur_dir/$out_dir"
fi

# make log directory
if [ ! -d "$cur_dir/$out_dir/app-img/log" ]; then
  mkdir -p "$cur_dir/$out_dir/app-img/log"
fi
# make log directory
if [ ! -d "$cur_dir/$out_dir/nginx-img/log" ]; then
  mkdir -p "$cur_dir/$out_dir/nginx-img/log"
fi
# make conf directory
if [ ! -d "$cur_dir/$out_dir/nginx-img/conf" ]; then
  mkdir -p "$cur_dir/$out_dir/nginx-img/conf"
fi
# make crt directory
if [ ! -d "$cur_dir/$out_dir/nginx-img/crt" ]; then
  mkdir -p "$cur_dir/$out_dir/nginx-img/crt"
fi

cp "$cur_dir/docker-compose.yml" "$cur_dir/$out_dir/"
cp "$cur_dir/.env" "$cur_dir/$out_dir/"
cp -r "$cur_dir/app-img/out" "$cur_dir/$out_dir/app-img/out"
cp "$cur_dir/app-img/Dockerfile" "$cur_dir/$out_dir/app-img/"
cp "$cur_dir/nginx-img/Dockerfile" "$cur_dir/$out_dir/nginx-img/"
cp "$cur_dir/nginx-img/conf/nginx_app.template" "$cur_dir/$out_dir/nginx-img/conf/"

# copy the keys
cp "$cur_dir/nginx-img/crt/$DOCKEDDOTNET_DOMAIN.crt" "$cur_dir/$out_dir/nginx-img/crt/"
cp "$cur_dir/nginx-img/crt/$DOCKEDDOTNET_DOMAIN.key" "$cur_dir/$out_dir/nginx-img/crt/"

# path must end in / when uploading a file to a folder
# with duck sftp tunnels to root
duck -i "~/.ssh/id_rsa" --upload "sftp://$DOCKEDDOTNET_REMOTE_USERNAME@$DOCKEDDOTNET_REMOTE_ADDRESS$DOCKEDDOTNET_REMOTE_HOME" "$cur_dir/$out_dir"
