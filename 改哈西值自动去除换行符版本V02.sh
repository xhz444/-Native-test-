#!/bin/sh

echo  "                                        "
echo -e "\e[31m- 本脚本制作于2024年09月14日\e[0m"
echo -e "\e[33m- 脚本作者:酷安用户 topmiaohan 和 西西弗斯96号技师
二改：见清\e[0m"
echo -e "\e[32m- 脚本功能:生成一个可在每次开机时重置verifiedBoot哈希值的Magisk模块，并自动把这个模块刷入手机\e[0m"
echo  "                                        "

# 定义一个函数来创建模块目录
create_module_dir() {
    mkdir -p /data/adb/modules/Reset_BootHash
    echo "模块目录创建成功。"
}

# 定义一个函数来删除模块目录
delete_module_dir() {
    rm -rf /data/adb/modules/Reset_BootHash
    echo "模块目录已删除。"
}

# 检查是否安装了tricky_store模块
check_tricky_store() {
    if [ -d "/data/adb/tricky_store/" ]; then
        echo -e "\033[0;35m已安装tricky_store模块，继续进行操作。\033[0m"
        return 0
    else
        echo -e "\033[0;35m未安装tricky_store模块，请先安装tricky_store模块。\033[0m"
        return 1
    fi
}

# 检查tricky_store模块是否安装
check_tricky_store
if [ $? -ne 0 ]; then
    delete_module_dir
    exit 1
fi

# 提示用户输入一个字符串
for i in {1..3}; do
    echo -e "\033[0;33m请从密钥认证APP里获取你本人手机的verifiedBootHash值"
    echo -e "\033[0;33m然后粘贴到下边，按两次回车键确认!\033[0m"
    echo -e "\033[0;33m请从密钥认证APP里获取你本人手机的verifiedBootHash值"
    echo -e "\033[0;33m然后粘贴到下边，按两次回车键确认!\033[0m"
    echo -e "\033[0;33m请从密钥认证APP里获取你本人手机的verifiedBootHash值"
    echo -e "\033[0;33m然后粘贴到下边，按两次回车键确认!\033[0m"
    
done

# 读取用户输入，直到遇到一个空行
input_string=""
while IFS= read -r line; do
    if [ -z "$line" ]; then
        break
    fi
    input_string="$input_string$line "
done

# 使用tr命令去除字符串中的所有空格
no_space_string=$(echo "$input_string" | tr -d ' ')

# 输出处理后的字符串
echo "去除多余空格换行符后的字符串: $no_space_string"

if [ -z "$no_space_string" ]; then
    echo -e "\033[0;33m未输入任何内容，脚本将不执行任何操作。\033[0m"
    delete_module_dir
    exit 1
else
    create_module_dir
    echo "resetprop -n ro.boot.vbmeta.digest $no_space_string" >> /data/adb/modules/Reset_BootHash/service.sh
    echo -e "把输入的verifiedBootHash值添加到模块...\033[0;32m完成\033[0m"
fi

# 写入模块属性
echo "id=Reset_BootHash
name=重置哈希值
version=v2024.09.14
versionCode=20240914
author=酷安用户 topmiaohan 和 西西弗斯96号技师 二改：见清
description=解决因禁用avb校验导致的分区问题。" > /data/adb/modules/Reset_BootHash/module.prop

echo -e "脚本正在生成模块...\033[0;32m完成\033[0m"
echo -e "脚本正在把生成的模块安装到手机...\033[0;32m完成\033[0m"

echo "脚本执行完毕，请重启手机后查看牛头人应用！"