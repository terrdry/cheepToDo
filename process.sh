#!/bin/bash -l
testMode="false"

if [ $testMode = "true" ]; then
  DEST_DIR=/develop/cheepTodo
  AWK_DIR=$DEST_DIR
else
  DEST_DIR=/Dropbox/todo
  AWK_DIR=ToDo
fi

#assign our directories
todo=/$HOME/$DEST_DIR/todo.txt
donefile=/$HOME/$DEST_DIR/done.txt
awkfile=/$HOME/$AWK_DIR/todo.awk

# Generate our completed recurring events
gawk -f $awkfile $todo >> $todo

# extract completed items and append
sed -n '/^x/p' $todo >> $donefile

# delete the completed items and update todo file
sed -ibak '/^x/d' $todo
