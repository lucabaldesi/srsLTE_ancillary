#!/bin/bash

if [ $# -ne 2 ]; then
	echo -e "Usage:\n\t$0 [epc|enb|ue] <conf_folder>"
	exit 1
fi

WD=$(dirname $0)
ENTITY=$1
CONFD=$WD/conf/$2
BUILD=$WD/conf/$2/build

if [ ! -d $CONFD ]; then
	echo "$CONFD is not a valid directory"
	exit 1
fi
if [ ! -d $BUILD ]; then
	echo "$BUILD not found"
	exit 1
fi

cd $CONFD
case $ENTITY in
	epc)
		sudo build/srsepc/src/srsepc epc.conf
		;;
	enb)
		sudo build/srsenb/src/srsenb enb.conf
		;;
	ue)
		sudo build/srsue/src/srsue ue.conf
		;;
	*)
		echo "$ENTITY not available"
		;;
esac
cd $WD
