#!/bin/bash
### Command line input options ###


deleteClusters() {
kubectx $provider
filename="broken."$provider".clusters.txt"

    echo "Deleteing all TKGs Clusters using vSphere Plugin: Provider $provider in delete file $filename"
    declare -a listArr
    listArr=(`cat "$filename"`)
    len=${#listArr[@]};

for (( i = 0 ; i < $len ; i++))
do
    echo "Delete issued on: ${listArr[$i]} "
    kubectl delete tanzukubernetescluster -n $provider ${listArr[$i]}
done


}

providers="providers.txt"

    declare -a listArr
    listArr=(`cat "$providers"`)
    len=${#listArr[@]};


for (( i = 0 ; i < $len ; i++))
do
    echo "Calling for Delete on Provider: ${listArr[$i]} "
    provider=${listArr[$i]}
    deleteClusters $provider

done
