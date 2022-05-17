#!/bin/bash
npm install 
echo "Testing for build errors"
if npm run build 
then
	echo "No build errors, deploying...."
	echo "Pushing lastest build to github"
	if [ ! -z "$1" ];
	then
		git add .
		git commit -m "$1"
		echo "git commit message: $1"
		npm run start
		exit 1
	else
		echo "No commit message specified! Stopping...."
		echo "Pipeline usage like ./pipeline.sh <""commit message"">"
		exit 2
	fi
	
else
	echo "Build Errors Dectected! Stopping Build"
	exit 0
fi

