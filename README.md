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
   
    - NGINX_LOGS (=/var/log/nginx)
    
    - NGINX_SSL (=path)
    
    - NGINX_SSL_HOST (=path)
    
    - NGINX_CONFIG (=/etc/nginx/conf)
    
    - NGINX_CONFIG_HOST (=./nginx-img/conf)

    - NGINX_HOST (hostname i.e. =example.com)
  
    - DOLLAR=$ (hack..)
