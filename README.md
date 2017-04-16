======================
My Web App Composition
======================

For budget builds...

Procedure
=========

Publish App -

`> dotnet publish [...]/project.json -o [...]/app-img/out -c Release`

Move Files (ci noob?) -

`> duck --password **** --upload sftp://[user]@[host]:[port]/[path] C:\[path-to-repo]` 

.. note:: windows is \??

On remote host -

`> cd [path] && docker-compose up -d`

Files not in repo:
    - .env
    - ./nginx-img/crt
    - ./app-img/out

Environment Settings
====================

./.env
-------
    
    - APP_IMAGE_REPO (=myapp)
    
    - APP_IMAGE_TAG (=v0.1)
    
    - APP_PORT (=30000)

    - APP_LOG_PATH
   
    - NGINX_LOGS (=/var/log/nginx)
    
    - NGINX_SSL (=path)
    
    - NGINX_SSL_HOST (=path)
    
    - NGINX_CONFIG (=/etc/nginx/conf)
    
    - NGINX_CONFIG_HOST (=./nginx-img/conf)

    - NGINX_HOST (hostname i.e. =example.com)
  
    - DOLLAR=$ (hack..)


Gen SSL crt for Testing
-----------------------

# Use 'localhost' for the 'Common name'
openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout localhost.key -out localhost.crt

# Add the cert to your keychain
open localhost.crt

Testing
-------

Change docker-compose section -

    ports:
      - "5000:443"
      - "5001:80"
