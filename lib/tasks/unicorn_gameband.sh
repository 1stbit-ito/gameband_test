#!/bin/sh

NAME="Unicorn"
## ENV=production
ENV=development

ROOT_DIR="/home/gameband/api"

PID="${ROOT_DIR}/tmp/unicorn.pid"
CONF="${ROOT_DIR}/config/unicorn.rb"
## OPTIONS="--path /rails_app"
OPTIONS=""
CMD="bundle exec unicorn_rails -c ${CONF} -E ${ENV} -D ${OPTIONS}"

start()
{
  if [ -e $PID ]; then
    echo "$NAME already started"
    exit 1
  fi
  echo "start $NAME"
  cd $ROOT_DIR
  $CMD
}

stop()
{
  if [ ! -e $PID ]; then
    echo "$NAME not started"
    exit 1
  fi
  echo "stop $NAME"
  kill -QUIT `cat ${PID}`
  rm -f $PID
}

force_stop()
{
  if [ ! -e $PID ]; then
    echo "$NAME not started"
    exit 1
  fi
  echo "stop $NAME"
  kill -INT `cat ${PID}`
  rm -f $PID
}

reload()
{
  if [ ! -e $PID ]; then
    echo "$NAME not started"
    start
    exit 0
  fi
  echo "reload $NAME"
  kill -HUP `cat ${PID}`
}

restart()
{
    stop
    start
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  force-stop)
    force_stop
    ;;
  reload)
    reload
    ;;
  restart)
    restart
    ;;
  *)
    echo "Syntax Error: release [start|stop|force-stop|reload|restart]"
    ;;
esac
