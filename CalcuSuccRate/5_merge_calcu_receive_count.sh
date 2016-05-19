# 输出相同SN第一行到文件receive_first
./4_first_receive_in_filter.sh $1 $2 > receive_first
# 输出相同SN最后一行到文件receive_last
./4_last_receive_in_filter.sh $1 $2 > receive_last
# 合并相同 devEUI
awk 'NR==FNR{a[$1]=$0}NR>FNR{print a[$1],$0'} receive_first receive_last |
# 输出合并结果
awk '{print $0}'| 
# 计算send cound
awk '{print $1,"receive count: "$4-$2}'
# 删除临时文件
rm receive_first receive_last
