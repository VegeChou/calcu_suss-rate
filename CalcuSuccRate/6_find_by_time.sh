while getopts "s:e:" opt #选项后面的冒号表示该选项需要参数
do
    case $opt in
        s)
			START_TIME=$OPTARG
			;;
        e)
			END_TIME=$OPTARG
            ;;
        ?)  #当有不认识的选项的时候arg为?
            echo "无效参数"
            exit 1
        ;;
    esac
done
echo $START_TIME
echo $END_TIME
START=$(date -d $START_TIME +%s)'000'
END=$(date -d $END_TIME +%s)'000'
echo start time: $START
echo end time: $END
if [[ $START = '000' ]] || [[ $END = '000' ]]; then
	echo 'start or end time is error'
else
	# receive
	./5_merge_calcu_receive_count.sh $START $END > receive
	# send
	./5_merge_calcu_send_count.sh $START $END > send
	# merge and echo to file
	cat receive send |  awk '{a[$1]=a[$1]?a[$1]" "$4:$4}END{for(i=0;i++<asorti(a,b);)print b[i],a[b[i]]}' > cloud
	# merge and echo to console
	cat receive send |  awk '{a[$1]=a[$1]?a[$1]" "$4:$4}END{for(i=0;i++<asorti(a,b);)print b[i],a[b[i]]}'
	# delete
	rm -rf receive send
fi
