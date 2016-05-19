# 所有下行
./find_all_count.sh | grep 'downlink' |
# 选择字段
awk '{print $5,$7,$9}' |
# 时间排序
sort -k 1
