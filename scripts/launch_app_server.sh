#!/bin/bash

cd ~
mysql.server start
screen -d -m

# make screen for redis
screen -p 0 -X title "redis"
screen -p 0 -X stuff 'redis-server'

# make screen for django dev server
screen -X screen
screen -p 1 -X title "django"
screen -p 1 -X stuff 'source ~/code/venvs/APPURIFY/bin/activate'
screen -p 1 -X stuff 'cd ~/code/Appurify/django'
screen -p 1 -X stuff './manage.py runserver --nothreading'

# make screen for websocket server
screen -X screen
screen -p 2 -X title "websocket_server"
screen -p 2 -X stuff 'source ~/code/venvs/APPURIFY/bin/activate'
screen -p 2 -X stuff 'cd ~/code/Appurify/django'
screen -p 2 -X stuff './manage.py run_websocket_server'

# make screen for websocket worker
screen -X screen
screen -p 3 -X title "websocket_worker"
screen -p 3 -X stuff 'echo "whaaat"'
screen -p 3 -X stuff 'source ~/code/venvs/APPURIFY/bin/activate'
screen -p 3 -X stuff 'cd ~/code/Appurify/django'
screen -p 3 -X stuff './manage.py run_websocket_worker'
