#!/bin/bash

function setup () {
    cd ~
    mysql.server start
    screen -d -m
}

last_screen_number=0
function run_on_new_screen () {
    let last_screen_number++
    name="$1"
    command="$2"
    screen -X screen
    screen -p $last_screen_number -X title $name
    screen -p $last_screen_number -X stuff 'source ~/code/venvs/APPURIFY/bin/activate'
    screen -p $last_screen_number -X stuff 'cd ~/code/Appurify/django'
    screen -p $last_screen_number -X stuff "$command"
}

setup

screen -p 0 -X title "redis"
screen -p 0 -X stuff 'redis-server'

run_on_new_screen 'django' './manage.py runserver --nothreading'
run_on_new_screen 'websocket_server' './manage.py start_push_server'
run_on_new_screen 'celery' './manage.py celery worker --beat'
run_on_new_screen 'rabbitmq' 'rabbitmq-server'
run_on_new_screen 'grunt' 'cd static/new; grunt dev'
