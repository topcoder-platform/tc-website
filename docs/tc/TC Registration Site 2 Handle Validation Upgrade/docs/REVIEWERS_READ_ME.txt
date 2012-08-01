Hi, Reviewers,

Please refer to the Verification to reivew. If you have problem in deploying, you could turn to my VM for review.
My VM ip is: 23.22.7.228

Sample Deployment instruction on VM.

# Upload and extract the submission to /tmp
unzip submission.zip 

# Checkout JS, CSS and image assets
cd /tmp
mkdir tcdocs/
cd tcdocs/
svn co https://coder.topcoder.com/internal/gd/trunk/website/tcdocs/ .

# Delete all hidden .svn files
rm -rf `find . -name .svn`

# Deploy assets
cd /tmp/tcdocs
cp -vR i/reg/ /mnt/apache/tcdocs/i/
cp -vR css/reg/ /mnt/apache/tcdocs/css/
cp -vR js/reg/ /mnt/apache/tcdocs/js/

# Deploy database change
su -l informix
dbaccess - /tmp/submission/DDL/Update.sql >1.log 2>2.log
dbaccess - /tmp/submission/DDL/invalidHandles.sql >1.log 2>2.log

# Deploy code changes
cd /home/tc/web && ant -f build_tc.xml deploy
jbb
./kill.sh
./start.sh