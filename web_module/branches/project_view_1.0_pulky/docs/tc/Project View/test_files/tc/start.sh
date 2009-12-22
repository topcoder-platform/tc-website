#! /bin/ksh

#remove old temp uploaded files
rm -rf ~/temp_files
mkdir ~/temp_files

nohup ./run.sh -c all -Djava.security.auth.login.config=/home/tc/jboss-4.0.4.GA/bin/auth.conf -Djboss.partition.name=TCPartition > ./nohup.out 2>&1 &

