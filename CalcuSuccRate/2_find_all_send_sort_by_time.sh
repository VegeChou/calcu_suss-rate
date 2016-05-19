# 所有下行
./1_find_all.sh | grep 'downlink'|
# 选取字段
awk '{print $5,$7,$9}' |
# 时间排序
sort -k 1
