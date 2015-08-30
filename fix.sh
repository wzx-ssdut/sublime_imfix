#!/bin/bash

# 安装依赖库
sudo apt-get install build-essential
sudo apt-get install libgtk2.0-dev

# 编译共享库
echo "编译libsublime-imfix.so..."
gcc -shared -o libsublime-imfix.so sublime_imfix.c `pkg-config --libs --cflags gtk+-2.0` -fPIC

# 移动共享库到Sublime Text 3安装目录
sudo mv libsublime-imfix.so /opt/sublime_text


echo "修复启动..."
# 创建启动脚本
sudo cp ./subl /usr/bin/subl
sudo chmod +x /usr/bin/subl

# 修改/usr/share/appliations/sublime_text.desktop
sudo sed -i 's/\/opt\/sublime_text\/sublime_text/subl/g' /usr/share/applications/sublime_text.desktop

echo "Done."

exit 0
