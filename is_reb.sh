#!/bin/bash

# MongoDB connection string
MONGO_URI="mongodb://10.10.1.3:27018/admin"

# Output file path
OUTPUT_FILE="/tmp/bas.txt"

# Function to get sh.status() and append to the output file
get_sh_status() {
	# 获取以下命令的返回值：/users/ruixuan/code/mongo/mongo $MONGO_URI --eval "sh.status()"
	# 将之存在一个变量当中
	sh_status=$(/users/ruixuan/code/mongo/mongo $MONGO_URI --eval "sh.status()")
	# 获取当前时间
	current_time=$(date)
	# 从$sh_status中提取出包含Currently running:的行
	currently_running=$(echo "$sh_status" | grep "Currently running:")
	# 将上述行和当前时间写入到$OUTPUT_FILE中
	echo "$current_time $currently_running" >> $OUTPUT_FILE
}

# Infinite loop to get sh.status() every 5 seconds
while true; do
	get_sh_status
	sleep 1
done
