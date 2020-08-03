#!/bin/bash

IFS=',' read -r -a array <<< "$1"
for element in "${array[@]}"
do
    git add "$element"
done
git commit -m "commited All" 
docker build . -t shaharkl/pipline:v.0.0  
docker push shaharkl/pipline:v.0.0
