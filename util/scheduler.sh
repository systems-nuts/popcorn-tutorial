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

# Check the System process every 1 sec and send signal. 
while true
do
	Threads=`ps -A -T | grep $KEYWORD | awk '{if (NR>1) {print $2}}'`;
	CurrentNum=`ps -A -T | grep $KEYWORD | awk '{if (NR>1) {print $2}}' | wc -l`;
	MYSELF=`cat /proc/popcorn_peers | awk '/^*[ \t]+[0-9]+[ \t]+[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+[ \t]+/{print $3}'` ;
	if [ -z "$MYSELF" ] ; then echo "Error: malformed /proc/popcorn_peers" ; exit 1 ; fi
	ALL=`cat /proc/popcorn_peers | sed 's/*/ /' | awk '/^[ \t]+[0-9]+[ \t]+[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+[ \t]+/{print $2}'`
	if [ -z "$ALL" ] ; then echo "Error: malformed /proc/popcorn_peers (all)" ; exit 1 ; fi

	for CURRENT in $ALL ; 
	do
		if [ "$CURRENT" = "$MYSELF" ] ; then continue ; fi
	  	Remotes=`${PASSWORD}ssh root@$CURRENT ps -A -T | grep popcorn | awk '{if (NR>1) {print $2}}'`;
	  	RemoteNum=`${PASSWORD}ssh root@$CURRENT ps -A -T | grep popcorn | awk '{if (NR>1) {print $2}}' | wc -l `;
		if [ $RemoteNum -eq $CurrentNum ] ;  then break ; fi
		if [ $RemoteNum -gt $CurrentNum ]  
			then
			let time=($RemoteNum-$CurrentNum)/2
			for thread in $Remotes ; 
			do
				${PASSWORD}ssh root@$CURRENT kill -35 $thread
				let time=$time-1  
                                if [ $time -eq 0 ] ; then break ; fi
			done
			break;
		fi
		if [ $RemoteNum -lt $CurrentNum ]  
			then
			let time=($CurrentNum-$RemoteNum)/2
                        for thread in $Threads ; do
                                kill -35 $thread
				let time=$time-1
				if [ $time -eq 0 ] 
				then break 
				fi
                        done
			break;
		fi
	done	
done
