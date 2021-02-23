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
`./run.sh test-latest`

### 2. Install emulators
`./run.sh latest`

### 3. Create a new image from a container’s changes
`./run.sh commit`

### (or) 1.2.3. Pull nkpro/dokau-pu:final
```bash
sudo docker pull nkpro/dokau-pu:final
```

### 4. Test image (emulators installed)
`./run.sh test-final`

### 5. Create a new container (to login)
`./run.sh final`

#### To do|check
* `rm /.dockerenv`
* `grep docker /proc/self/cgroup > /dev/null || printf '\xF0\x9F\x91\x8D\x0A'`
* `grep -i 'container=docker' /proc/1/environ > /dev/null || printf '\xF0\x9F\x91\x8D\x0A'`
* `rm /run/systemd/container`
* `grep hypervisor /proc/cpuinfo > /dev/null || printf '\xF0\x9F\x91\x8D\x0A'`

### 6. Ready To Use
> To START `./run start`  
> To STOP  `./run stop`  
> To run in foreground (start & attach) `./run attach`  

<br /><br /><br />
# Published for Fair Use ONLY!
