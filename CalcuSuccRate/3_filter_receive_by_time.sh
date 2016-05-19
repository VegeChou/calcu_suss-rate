startTime=$1
endTime=$2
# 所有接收包按时间排序
./2_find_all_receive_sort_by_time.sh |
# 过滤大于startTime
awk -v startTime=$startTime '{if($1 > startTime)print$0}'|
# 过滤小于endTime
awk -v endTime=$endTime '{if($1 < endTime)print$0}'
