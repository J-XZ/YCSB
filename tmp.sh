sudo ssh node3 "sudo smartctl -a /dev/nvme0n1 >/root/smart3.txt"
sudo ssh node4 "sudo smartctl -a /dev/nvme0n1 >/root/smart4.txt"
sudo ssh node5 "sudo smartctl -a /dev/nvme0n1 >/root/smart5.txt"
sudo ./bin/ycsb.sh load mongodb -s -P /users/ruixuan/code/YCSB/workloads/workloada -threads 3 -p recordcount=10000000 -p operationcount=10000000 -p fieldcount=10 -p fieldlength=100 -p readproportion=0 -p updateproportion=1 -p scanproportion=0 -p insertproportion=0 -p requestdistribution=zipfian -p mongodb.upsert=true -p core_workload_insertion_retry_limit=10 -p mongodb.url=mongodb://10.10.1.3:27018/admin -p writeallfields=true >/tmp/load10G.txt 2>&1
sudo ssh node3 "sudo smartctl -a /dev/nvme0n1 >/root/smart3_end.txt"
sudo ssh node4 "sudo smartctl -a /dev/nvme0n1 >/root/smart4_end.txt"
sudo ssh node5 "sudo smartctl -a /dev/nvme0n1 >/root/smart5_end.txt"
