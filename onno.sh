#!/bin/bash

loading_animation() {
  echo -n "Loading"
  while kill -0 $! 2>/dev/null; do
    for i in {1..5}; do
      echo -n "."
      sleep 1
    done
    echo -ne "\rLoading      "  # Menghapus titik sebelumnya
  done
  echo " Done!"
}

echo "####################################❤❖﷽❖❤#####################################"
echo "********************************(khasbunalloh wanikmal wakil)*******************************"
echo "############################################################################################"
echo "#..%%%%...%%..%%..%%..%%...%%%%.....%%..%%..%%..%%..%%..%%..%%..%%..%%..%%..%%%%%....%%%%..#"
echo "#.%%..%%..%%%.%%..%%%.%%..%%..%%.....%%%%...%%..%%..%%.%%...%%..%%..%%..%%..%%..%%..%%..%%.#"
echo "#.%%..%%..%%.%%%..%%.%%%..%%..%%......%%....%%..%%..%%%%....%%..%%%%%%..%%..%%%%%...%%..%%.#"
echo "#.%%..%%..%%..%%..%%..%%..%%..%%......%%....%%..%%..%%.%%...%%..%%..%%..%%..%%..%%..%%..%%.#"
echo "#..%%%%...%%..%%..%%..%%...%%%%.......%%.....%%%%...%%..%%..%%..%%..%%..%%..%%..%%...%%%%..#"
echo "############################################################################################"
echo "*****************************©2022 - 🅞🅝🅝🅞 🅨🅤🅚🅘🅗🅘🅡🅞***********************************"
sleep 5

# Menjalankan Docker di latar belakang
docker run --rm \
  --tmpfs /run  --tmpfs /run/lock --tmpfs /tmp \
  --cap-add SYS_BOOT --cap-add SYS_ADMIN \
  -v /sys/fs/cgroup:/sys/fs/cgroup \
  -e PASSWORD=123654 \
  -p 6080:6080 moyash/novnc-ros-desktop:melodic &

# Simpan PID dari proses Docker
DOCKER_PID=$!

# Disown proses untuk memastikan berjalan di latar belakang
disown $DOCKER_PID

# Menampilkan animasi loading
loading_animation

# Jeda panjang yang tetap berlangsung di latar belakang
sleep 9876543210

