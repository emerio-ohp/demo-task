#!/bin/bash
if (("$#" == 2))
then
  pushd $1 > /dev/null
  if git remote -v update 2>&1 \
     | grep $2 | grep "up to date" \
     &> /dev/null
  then
    echo "Repository unchanged"
  else
    echo "Repository changed, updating"
    git checkout $2
    git pull origin $2
    
    # Insert rebuilding / dependency logic here
  fi
  popd > /dev/null
else
  me=`basename $0`
  echo "Usage: $me /root/demo/demo-task  master"
fi
