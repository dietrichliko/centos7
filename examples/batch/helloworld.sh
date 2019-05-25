#! /bin/sh

echo "Hello world!"
echo 

if [ -z "$SINGULARITY_CONTAINER" ]
then
   echo "It seems I am not in a container"
else
   echo "My container is $SINGULARITY_CONTAINER"
fi
echo

echo "My OS is $(cat /etc/redhat-release)"
echo
