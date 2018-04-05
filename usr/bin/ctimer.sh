#!/bin/sh
JAM_NOW=`date +"%H:%M:%S" | cut -d':' -f1`
MEN_NOW=`date +"%H:%M:%S" | cut -d':' -f2`
DET_NOW=`date +"%H:%M:%S" | cut -d':' -f3`

JAM_SET_START="`uci get fdicctv.timer.awal | awk -F':' '{print $1}'`"
MEN_SET_START="`uci get fdicctv.timer.awal | awk -F':' '{print $2}'`"
DET_SET_START="`uci get fdicctv.timer.awal | awk -F':' '{print $3}'`"

JAM_SET_END="`uci get fdicctv.timer.akhir | awk -F':' '{print $1}'`"
MEN_SET_END="`uci get fdicctv.timer.akhir | awk -F':' '{print $2}'`"
DET_SET_END="`uci get fdicctv.timer.akhir | awk -F':' '{print $3}'`"

STATUS=`uci get fdicctv.timer.status`
## Nyala

if [ "$STATUS" == "1" ];then

echo "SEKARANG: $JAM_NOW:$MEN_NOW"
echo "SETTING_START : $JAM_SET_START:$MEN_SET_START"
echo "SETTING_END : $JAM_SET_END:$MEN_SET_END"

CEK(){
while [ 1 ];do
Count=0
LIMIT=`find -L /root/CCTV -name "*.jpg" | grep -v "snap*" | wc -l`
        until [ $Count -gt "$LIMIT" ];do
        if [ $LIMIT == $(find -L /root/CCTV -name "*.jpg" | grep -v "snap*" | wc -l) ];then
                echo "Sleeping for next 5 seconds"
                sleep 1
                LIMIT=`find -L /root/CCTV -name "*.jpg" | grep -v "snap*" | wc -l`
                echo "$(let Count=LIMIT+1; echo $Count)"
        else
		fdi_cam mail && fdi_cam alarm
                let Count=LIMIT+1
        fi
        done
break
done
}

JM(){
case $1 in
	'JAM')
	if [ $JAM_NOW -ge $JAM_SET_START ] && [ $JAM_SET_START -lt $JAM_SET_END ];then
		echo "ALARM DI AKTIFKAN"
		PID="`ps | grep timer | wc -l`"
		PIDF="`ps | grep fdicctv | wc -l`"	
		if [ "$PID" -le 5 ] && [ $PIDF -le 1 ];then	
			$(CEK)
		fi
	elif [ $JAM_NOW -le "$JAM_SET_END" ];then
		echo "alarm di matikan"
	else
		echo "do nothing"
	fi
	;;
esac
}
JM JAM
fi
## Mati
