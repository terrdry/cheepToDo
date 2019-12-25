#!/bin/bash
if [ -z $1 ]; then
  choice="deploy"
else
  choice=$1
fi

echo "Using:"$choice

case $1 in
  deploy)
    echo 'Deploying...'
    cp process.sh ~/ToDo/process.sh
    cp todo.awk ~/ToDo/todo.awk
    ;;
  diff)
    echo 'Diffing...'
    diff process.sh ~/ToDo/process.sh
    diff todo.awk ~/ToDo/todo.awk
    ;;
  *)
    echo "$choice not supported"
    echo "---Default Action----"
    echo "./deploy.sh"
    echo "./deploy.sh deploy"
    echo "---Diff Action----"
    echo "./deploy.sh diff"
    ;;
esac

