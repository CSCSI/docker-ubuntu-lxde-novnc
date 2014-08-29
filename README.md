docker-ubuntu-lxde-novnc
=========================

From Docker Index
```
docker pull keyz182/ubuntu-lxde-novnc
```

Build yourself
```
git clone https://github.com/CSCSI/docker-ubuntu-lxde-novnc.git
docker build --rm -t keyz182/ubuntu-lxde-novnc docker-ubuntu-lxde-novnc
```

Run
```
docker run -i -t -p 6080:6080 keyz182/ubuntu-lxde-novnc
```

Browse http://127.0.0.1:6080/vnc.html
