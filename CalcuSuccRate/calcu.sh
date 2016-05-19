# 合并相同 devEUI
awk 'NR==FNR{a[$1]=$0}NR>FNR{print a[$1],$0'} $1 $2 |
# 输出合并结果
awk '{print $0}' |
# 去除终端和云端不匹配的行
awk '/.*\s.*\s.*\s.*\s.*\s.*/' |
# 计算丢包率
awk '{print $1,"uplink: "$5/$2*100"%","downlink: "$3/$6*100"%"}'
