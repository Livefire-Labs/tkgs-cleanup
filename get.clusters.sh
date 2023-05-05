#!/bin/bash
# Author: Ben Todd
# Use: Build a Bunch of clusters for testing scale out
# 
# 
# 
# cleanup
rm ./broken*.txt


getClusters() {

filename="broken."$provider".clusters.txt"
echo "Saving to: " $filename
kubectx $provider
kubectl get clusters -n $provider -o json |jq ".items[].metadata.ownerReferences[].name" | sed 's/"//g' > $filename
code $filename

}


providers="providers.txt"

    declare -a listArr
    listArr=(`cat "$providers"`)
    len=${#listArr[@]};


for (( i = 0 ; i < $len ; i++))
do
    echo "Calling for get List on Provider: ${listArr[$i]} "
    provider=${listArr[$i]}
    getClusters $provider

done
