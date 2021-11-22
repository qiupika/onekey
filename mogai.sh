#!/usr/bin/env bash
 echo -e "\e[36m
   ▄▄▄▄       ██                         ▄▄▄▄                                   
  ██▀▀██      ▀▀                         ▀▀██                                   
 ██    ██   ████     ██▄████▄   ▄███▄██    ██       ▄████▄   ██▄████▄   ▄███▄██ 
 ██    ██     ██     ██▀   ██  ██▀  ▀██    ██      ██▀  ▀██  ██▀   ██  ██▀  ▀██ 
 ██    ██     ██     ██    ██  ██    ██    ██      ██    ██  ██    ██  ██    ██ 
  ██▄▄██▀  ▄▄▄██▄▄▄  ██    ██  ▀██▄▄███    ██▄▄▄   ▀██▄▄██▀  ██    ██  ▀██▄▄███ 
   ▀▀▀██   ▀▀▀▀▀▀▀▀  ▀▀    ▀▀   ▄▀▀▀ ██     ▀▀▀▀     ▀▀▀▀    ▀▀    ▀▀   ▄▀▀▀ ██ 
       ▀                        ▀████▀▀                                 ▀████▀▀
-----------------------------烟雨阁出品一键-------------------------------------
-----------------------------原作者：风之凌殇-----------------------------------
\e[0m\n"
sleep 5
echo 开始执行替换魔改互助文件
wget https://ghproxy.com/https://raw.githubusercontent.com/yanyuwangluo/tuku/main/mogai/task_before.sh -O task_before.sh

wget https://ghproxy.com/https://raw.githubusercontent.com/yanyuwangluo/tuku/main/mogai/code.sh -O code.sh

wget https://ghproxy.com/https://raw.githubusercontent.com/yanyuwangluo/tuku/main/mogai/jdCookie.js -O jdCookie.js

echo 下载完成

sleep 3
echo 正在替换jdcookie.js

[[ -f /ql/config/jdCookie.js ]] && find /ql/scripts -type f -name jdCookie.js|xargs -n 1 cp -rf /ql/config/jdCookie.js

echo 执行结束告辞。
