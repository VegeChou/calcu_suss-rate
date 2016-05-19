# 取出所有符合时间排序的receive数据
./3_filter_receive_by_time.sh $1 $2 |
# 相同字段取第一行
awk '{a[$2]=$0}END{for(i=1;i<=asort(a);i++)print a[i]}' |
# 根据sn排序
sort -k 2 |
# 取出相关字段
awk '{print $2,$3}'|
# 去掉 devEUI 两次 ' 符号
awk -F"'" '{print $2,$3}'
