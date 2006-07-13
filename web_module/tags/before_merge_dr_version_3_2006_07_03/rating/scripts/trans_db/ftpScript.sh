#!/bin/sh
#
# Shovel the hosts file onto the novell server, courtesy of ftp.
#
# @(#) $Id$
#

FTPHOST=192.168.14.52
USER_RATING=tcs_ratings.unl
SCORES=dw_scores.unl
#SCORES=mess

DEST=''
#TMPF=${HOME}/puthosts.$$
TMPF=${HOME}/moveFiles.$$

#USAGE="usage: $0 [ -h host ] [ -d d:/path/destfile ]"

#while getopts nh:d: flag
#do
# case $flag in
# n) HOSTS=/etc/inet/networks
#  ;;
# h) FTPHOST="$OPTARG"
#  ;;
# d) DEST="$OPTARG"
#  ;;
# \?) echo "$USAGE" 1>&2
#  exit 1
#  ;;
# esac
#done

# Automatically remove our temp copy at exit & signal.
trap "rm -f $TMPF" 0 1 2 3 15
# Needed to get around .netrc restrictions.
umask 077

echo "Copying $USER_RATING to $DEST on $FTPHOST"

# A simple trick to avoid echoing passwords to the screen.
#echo "Password for dom: \c"
#stty -echo
#read PASS
#stty echo
#echo ""

# This is our created .netrc file.  The "init" macro will automatically
# be executed on connection.  See netrc(4).
cat <<EOF >$TMPF
machine $FTPHOST
login informix
password DblM1nt
macdef init
ascii
put $SCORES scripts/rating/$SCORES 
put $USER_RATING scripts/rating/$USER_RATING
bye

EOF

# Preserve an existing one...
if [ -f .netrc ]; then
 mv .netrc .netrc-orig
fi

# Put ours into place.
ln $TMPF ${HOME}/.netrc
ftp $FTPHOST
rm -f ${HOME}/.netrc

## And put the original back into place.
if [ -f .netrc.orig ]; then
 mv .netrc-orig .netrc 
fi

