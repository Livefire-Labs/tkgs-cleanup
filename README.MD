### Cleanup Script Based on the scenario that clusters create and "Deleted by TMC are "stuck"

1. Create .env to match your environment
useage:


serverIP=<supervisor cluster IP> \
userName=<user that has admin right to supervisor cluster>


2. run script ./login.sh - to log into Supervisor Cluster
3. Run script ./get.clusters.sh - this will create files for each namespace you have stuck clusters in
4. Edit these files to make sure there are no clusters in the list you want to keep
5. run script ./rem.cluster.sh - This will run a blocking call to the supervisor cluster to delete all the clsuters in the files you send. SO this may take some time and your sesssion will release when it is done.