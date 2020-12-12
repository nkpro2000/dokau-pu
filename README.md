# DokAU for Personal Use

### 0. New data-root and exec-root
`/etc/docker/daemon.json`  
```json
{
"data-root": "/mnt/dokau-data",
"exec-root": "/mnt/dokau-exec"
}
```
> you can replace `dokau-data` and `dokau-exec` by names of your choice.

***Required to restart docker service***

### 1. Test image
```bash
(read -p permanent\ dirname:\  CGNAME; sudo docker run --rm -p 6080:80 -p 5900:5900 -e RESOLUTION=1280x720 -v /dev/shm:/dev/shm --name testDOKAU --hostname linux --cgroup-parent $CGNAME --device /dev/snd:/dev/snd --group-add $(getent group audio | cut -d: -f3) --device /dev/video0:/dev/video0 --group-add $(getent group video | cut -d: -f3) nkpro/dokau-pu)
```

### 2. Install emulators
```bash
(read -p permanent\ dirname:\  CGNAME; sudo docker run -p 6080:80 -p 5900:5900 -e RESOLUTION=1280x720 -v /dev/shm:/dev/shm --name dokau --hostname linux --cgroup-parent $CGNAME --device /dev/snd:/dev/snd --group-add $(getent group audio | cut -d: -f3) --device /dev/video0:/dev/video0 --group-add $(getent group video | cut -d: -f3) nkpro/dokau-pu)
```

### 3. Create a new image from a container’s changes
```bash
sudo docker commit dokau nkpro/dokau-pu:final && sudo docker rm dokau
```

### (or) 1.2.3. Pull nkpro/dokau-pu:final
```bash
sudo docker pull nkpro/dokau-pu:final
```

### 4. Test image (emulators installed)
```bash
(read -p permanent\ dirname:\  CGNAME; sudo docker run --rm -p 6080:80 -p 5900:5900 -e RESOLUTION=1280x720 -v /dev/shm:/dev/shm --name testDOKAUf --hostname linux --cgroup-parent $CGNAME --device /dev/snd:/dev/snd --group-add $(getent group audio | cut -d: -f3) --device /dev/video0:/dev/video0 --group-add $(getent group video | cut -d: -f3) nkpro/dokau-pu:final)
```

### 5. Create a new container (to login)
```bash
(read -p permanent\ dirname:\  CGNAME; sudo docker run -p 6080:80 -p 5900:5900 -e RESOLUTION=1280x720 -v /dev/shm:/dev/shm --name dokau --hostname linux --cgroup-parent $CGNAME --device /dev/snd:/dev/snd --group-add $(getent group audio | cut -d: -f3) --device /dev/video0:/dev/video0 --group-add $(getent group video | cut -d: -f3) nkpro/dokau-pu:final)
```

### 6. Ready To Use
> To START `sudo docker start dokau`  
> To STOP  `sudo docker stop dokau`

<br /><br /><br />
# Published for Fair Use ONLY!
