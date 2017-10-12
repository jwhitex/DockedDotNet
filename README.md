
# Docker Nginx/Asp.Net Application Deployment


## Overview

This is a production ready docker deployment setup for an Asp.Net Core application hosted behind an Nginx reverse proxy. It is assumed that the Asp.Net Core application to depend on node (see the app-img Dockerfile).

# Getting Started

Create an .env file at the repo root directory. This is used by docker-compose.

Add the following to the file (change at your discretion):

```
APP_IMAGE_REPO=myapp
APP_IMAGE_TAG=v0.1
APP_PORT=5000
APP_LOG_PATH=/var/log/dotnet
APP_LOG_PATH_HOST=./app-img/log

NODE_ENV=production

DOLLAR=$

NGINX_HOST=localhost
NGINX_LOGS=/var/log/nginx
NGINX_SSL=/etc/nginx/ssl
NGINX_CONFIG=/etc/nginx/conf

NGINX_SSL_HOST=./nginx-img/crt
NGINX_LOGS_HOST=./nginx-img/log
NGINX_CONFIG_HOST=./nginx-img/conf

```

`note: DOLLAR=$ is a hack`


Publish your dotnet application to the app-img directory with the following command. Be sure to use absolute paths. 
*See Issue https://github.com/dotnet/cli/issues/3833*

    $ dotnet publish /path/to/your/project.json -o /path/to/this/repo/app-img/out -c Release

Change the ./app-img/Dockerfile to run your application. The default name is "Program.dll". Change it to "MyApp.dll" etc..

Now you're all set to test your app on your local machine. See testing section for additional steps you need to take to test, e.g. generating a crt and key.


## Deployment


It is assumed that you have docker and docker-compose installed and configured on a remote host.

The following environment variables should be set in your shell when using publish.sh:

```
DOCKEDDOTNET_DOMAIN=myapp.com
DOCKEDDOTNET_REMOTE_USERNAME=remote_username
DOCKEDDOTNET_REMOTE_ADDRESS=remote_address:remote_port
DOCKEDDOTNET_REMOTE_HOME="/home/$GROWLIDK_REMOTE_USERNAME/app"
```

Change value in .env when ready to deploy.

    NGINX_HOST=myapp.com

Add your crt and key file for the domain to the /nginx-img/crt folder.

Move Files (requires duck cli tool):


    $ bash publish.sh` 


`note: Script works on macOS.`

On remote host:


    $ cd [path] && docker-compose up -d


Now your all set! If all went well, good job. If not, don't frets. Search it out! :)

## Testing

### Gen x509 cert for Testing SSL

Use 'localhost' for the 'Common name'

    $ openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout localhost.key -out localhost.crt

Add the cert to your keychain

    $ open localhost.crt

Change value in .env:

    NGINX_HOST=localhost


## Other Notes

Files required but not in repo:
    
    - .env

    - ./nginx-img/crt/mysite.crt (crt and key)

    - ./app-img/out/ (your application)


