#!/bin/bash

# Tong Xing, Stevens 2019

# Send signal to thread that have keyword: "popcorn"
KEYWORD="popcorn"

# check for optional arguments
PASSWORD=""
for SCRIPTARG in "$@" ; do
  case $SCRIPTARG in
    -p=*|--password=*)
      PASSWORD="sshpass -p ${SCRIPTARG#*=} "
      shift
      ;;
    *)
      echo "Usage: ${0##*/} [-p|--password=PASSWORD]"
      exit 0
      ;;
  esac
done

MYSELF=`cat /proc/popcorn_peers | awk '/^*[ \t]+[0-9]+[ \t]+[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+[ \t]+/{print $3}'` ;
if [ -z "$MYSELF" ] ; then
	echo "Error: malformed /proc/popcorn_peers" ; exit 1 ; fi

ALL=`cat /proc/popcorn_peers | sed 's/*/ /' | awk '/^[ \t]+[0-9]+[ \t]+[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+[ \t]+/{print $2}'`
if [ -z "$ALL" ] ; then
	echo "Error: malformed /proc/popcorn_peers (all)" ; exit 1 ; fi

# Continuosly check the status of the system
while true ; do
	# list the current popcorn threads on the current machine
	THREADS=`ps -A -T | grep $KEYWORD | awk '{if (NR>1) {print $2}}'`;
	CURRENTNUM=`printf "$THREADS" | wc -l`;

	# Balance the number of threads for each machine (TODO extend the algo to more than 2 machines)
	for CURRENT in $ALL ; 
	do
		# skip if myself
		if [ "$CURRENT" = "$MYSELF" ] ; then continue ; fi
		
		# list the current popcorn threads on remote
	  	REMOTES=`${PASSWORD}ssh root@$CURRENT ps -A -T | grep $KEYWORKD | awk '{if (NR>1) {print $2}}'`;
	  	REMOTENUM=`printf "$REMOTES" | wc -l`;
		
		# already balanced
		if [ $REMOTENUM -eq $CURRENTNUM ] ; then sleep 1 ; break ; fi
		# remote has more threads - move threads to current
		if [ $REMOTENUM -gt $CURRENTNUM ] ; then
			let TIME=($REMOTENUM-$CURRENTNUM)/2
			for THREAD in $REMOTES ; do
				${PASSWORD}ssh root@$CURRENT kill -35 $THREAD
				let TIME=$TIME-1  
                                if [ $time -eq 0 ] ; then break ; fi
			done
			break;
		fi
		# remote has less threads - move threads to remote
		if [ $REMOTENUM -lt $CURRENTNUM ] ; then
			let TIME=($CURRENTNUM-$REMOTENUM)/2
                        for THREAD in $THREADS ; do
                                kill -35 $THREAD
				let TIME=$TIME-1
				if [ $TIME -eq 0 ] ; then break ; fi
                        done
			break;
		fi
	done	
done
