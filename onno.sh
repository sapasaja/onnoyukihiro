#!/bin/bash

loading_animation() {
  echo -n "Loading"
  for i in {1..5}; do
    echo -n "."
    sleep 1
  done
  echo ""
}

echo "####################################❤❖﷽❖❤#####################################"
loading_animation
sleep 5

echo "********************************(khasbunalloh wanikmal wakil)*******************************"
loading_animation
sleep 5

echo "############################################################################################"
loading_animation
sleep 5

echo "#..%%%%...%%..%%..%%..%%...%%%%.....%%..%%..%%..%%..%%..%%..%%..%%..%%..%%..%%%%%....%%%%..#"
loading_animation
sleep 5

echo "#.%%..%%..%%%.%%..%%%.%%..%%..%%.....%%%%...%%..%%..%%.%%...%%..%%..%%..%%..%%..%%..%%..%%.#"
loading_animation
sleep 5

echo "#.%%..%%..%%.%%%..%%.%%%..%%..%%......%%....%%..%%..%%%%....%%..%%%%%%..%%..%%%%%...%%..%%.#"
loading_animation
sleep 5

echo "#.%%..%%..%%..%%..%%..%%..%%..%%......%%....%%..%%..%%.%%...%%..%%..%%..%%..%%..%%..%%..%%.#"
loading_animation
sleep 5

echo "#..%%%%...%%..%%..%%..%%...%%%%.......%%.....%%%%...%%..%%..%%..%%..%%..%%..%%..%%...%%%%..#"
loading_animation
sleep 5

echo "############################################################################################"
loading_animation
sleep 5

echo "*****************************©2022 - 🅞🅝🅝🅞 🅨🅤🅚🅘🅗🅘🅡🅞***********************************"
loading_animation
sleep 5

docker run --rm \
  --tmpfs /run  --tmpfs /run/lock --tmpfs /tmp \
  --cap-add SYS_BOOT --cap-add SYS_ADMIN \
  -v /sys/fs/cgroup:/sys/fs/cgroup \
  -e PASSWORD=123654 \
  -p 6080:6080 moyash/novnc-ros-desktop:melodic
sleep 9876543210
