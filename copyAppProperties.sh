#!/bin/bash
projectPathList=`find ./ -depth -name "application-dev.yml" 2>/dev/null -exec realpath {} \;`
for projectPath in $projectPathList
do
  basePath=`dirname $projectPath`;
  dockerApplicationPropsYaml=`echo $basePath/application-docker.yml`;
  cd $basePath;
  if test -f application-docker.yml; then
      echo "$basePath/application-docker.yml exists, skip";
  else 
      echo "$basePath/application-docker.yml not exists, create";
      cp application-dev.yml application-docker.yml
  fi
done