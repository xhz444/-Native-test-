echo  "                                        "
echo "- 本脚本制作于2024年09月17日"
echo "- 脚本作者:酷安用户 topmiaohan 和 西西弗斯96号技师"
echo "- 脚本功能:生成一个可在每次开机时重置verifiedBoot哈希值的Magisk模块，并自动把这个模块刷入手机"
if [ -d /data/adb/modules/tricky_store ]; then
  mkdir -p /data/adb/modules/Reset_BootHash
  rm -f /data/adb/modules/Reset_BootHash/service.sh
  rm -f /data/adb/modules/Reset_BootHash/module.prop
  echo "id=Reset_BootHash
name=重置哈希值
version=v2024.09.17
versionCode=20240917
author=topmiaohan & 96号技师
description=辅助Tricky Store，实现增强BL隐藏。" >>/data/adb/modules/Reset_BootHash/module.prop
  echo  "                                        "
  echo -e "脚本正在生成模块...\033[0;32m完成\033[0m"
  echo -e "脚本正在把生成的模块安装到手机...\033[0;32m完成\033[0m"
  echo  "                                        "
  echo "接下来还有非常重要的一步，请按照以下步骤手动完成:"
  echo  "                                        "
  echo -e "\033[0;33m请从密钥认证APP里获取你本人手机的verifiedBootHash值\033[0m"
  echo -e "\033[0;33m然后粘贴到下边，按回车键确认!\033[0m"
  echo  "                                        "
  echo -e "\033[0;33m请从密钥认证APP里获取你本人手机的verifiedBootHash值\033[0m"
  echo -e "\033[0;33m然后粘贴到下边，按回车键确认!\033[0m"
  echo  "                                        "
  echo -e "\033[0;33m请从密钥认证APP里获取你本人手机的verifiedBootHash值\033[0m"
  echo -e "\033[0;33m然后粘贴到下边，按回车键确认!\033[0m"
  echo  "                                        "
  read Name
  if [ -z "$Name" ]; then
    echo "$(echo -e "\033[0;33m未输入任何内容，脚本将不执行任何操作。\033[0m")"
    rm -rf /data/adb/modules/Reset_BootHash/
    exit 1
  else
    echo "resetprop -n ro.boot.vbmeta.digest $Name" >> /data/adb/modules/Reset_BootHash/service.sh
    echo -e "把输入的verifiedBootHash值添加到模块...\033[0;32m完成\033[0m"
  fi
  echo  "                                        "
  echo "脚本执行完毕，请重启手机后查看牛头人应用！"
  echo "脚本执行完毕，请重启手机后查看牛头人应用！"
  echo "脚本执行完毕，请重启手机后查看牛头人应用！"
else  
  echo  "                                        "
  echo -e "  正在运行脚本...\033[0;31m失败\033[0m"
  echo -e "  正在分析失败原因...\033[0;31m未安装TrickyStore模块！\033[0m"
  echo  "                                        "
  echo -e "  \033[0;33m请先安装Tricky Store模块，再根据情况运行此脚本！\033[0m"
  echo -e "  \033[0;33m请先安装Tricky Store模块，再根据情况运行此脚本！\033[0m"
  echo -e "  \033[0;33m请先安装Tricky Store模块，再根据情况运行此脚本！\033[0m"
fi