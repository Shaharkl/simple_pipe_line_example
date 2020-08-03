#!/bin/bash

IFS=',' read -r -a array <<< "$1"
if [ ${#array[@]} -eq 0 ] 
then 
    echo "No argument"
    echo "There no use to run this script"
    exit 1
fi
for element in "${array[@]}"
do
    if [ ! -f "$element" ]  
    then
        echo "Error: $element file not found."
        exit 2
    else
        git add "$element"
    fi
done
git commit -m "$2" 
docker build . -t shaharkl/simple_pipeline:"$3"  
docker push shaharkl/simple_pipeline:"$3"
