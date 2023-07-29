#!/bin/bash
projectPathList=`find ./ -depth -name "mvnw" 2>/dev/null -exec realpath {} \;`
for projectPath in $projectPathList
do
  basePath=`dirname $projectPath`
  cd $basePath;
  $projectPath clean package -Dmaven.test.skip;
done