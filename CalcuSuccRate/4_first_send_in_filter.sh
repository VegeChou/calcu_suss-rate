# 取出所有符合时间排序的send数据
./3_filter_send_by_time.sh $1 $2 |
# 相同字段取第一行
awk '!a[$2]++' | 
# 根据sn排序
sort -k 2 |
# 取出相关字段
awk '{print $2,$3}'|
# 去掉 devEUI 两次 ' 符号
awk -F"'" '{print $2,$3}'
