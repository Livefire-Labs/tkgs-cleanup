# Log Into vsphere using kubectl vsphere plugin
# Show env vars
grep -v '^#' .env
# Export env vars
export $(grep -v '^#' .env | xargs)

echo "Connecting to Server: "$serverIP "With User: $userName"

kubectl vsphere login --server $serverIP --vsphere-username $userName --insecure-skip-tls-verify

