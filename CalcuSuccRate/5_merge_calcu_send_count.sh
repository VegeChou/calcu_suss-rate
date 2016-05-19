# 输出相同SN第一行到文件send_first
./4_first_send_in_filter.sh $1 $2 > send_first
# 输出相同SN最后一行到文件send_last
./4_last_send_in_filter.sh $1 $2 > send_last
# 合并相同 devEUI
awk 'NR==FNR{a[$1]=$0}NR>FNR{print a[$1],$0'} send_first send_last |
# 输出合并结果
awk '{print $0}'| 
# 计算send cound
awk '{print $1,"send count: "$4-$2}'
# 删除临时文件
rm send_first send_last
