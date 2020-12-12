RESOLUTION=1280x720
CGNAME=kc0d

case "$1" in
	test-latest)
		sudo docker run --rm -p 6080:80 -p 5900:5900 -e RESOLUTION=$RESOLUTION -v /dev/shm:/dev/shm --name testDOKAU --hostname linux --cgroup-parent $CGNAME --device /dev/snd:/dev/snd --group-add $(getent group audio | cut -d: -f3) --device /dev/video0:/dev/video0 --group-add $(getent group video | cut -d: -f3) nkpro/dokau-pu
		;;
	latest)
		sudo docker run -p 6080:80 -p 5900:5900 -e RESOLUTION=$RESOLUTION -v /dev/shm:/dev/shm --name dokau --hostname linux --cgroup-parent $CGNAME --device /dev/snd:/dev/snd --group-add $(getent group audio | cut -d: -f3) --device /dev/video0:/dev/video0 --group-add $(getent group video | cut -d: -f3) nkpro/dokau-pu
		;;
	commit)
		sudo docker commit dokau nkpro/dokau-pu:final && sudo docker rm dokau
		;;
	test-final)
		sudo docker run --rm -p 6080:80 -p 5900:5900 -e RESOLUTION=$RESOLUTION -v /dev/shm:/dev/shm --name testDOKAUf --hostname linux --cgroup-parent $CGNAME --device /dev/snd:/dev/snd --group-add $(getent group audio | cut -d: -f3) --device /dev/video0:/dev/video0 --group-add $(getent group video | cut -d: -f3) nkpro/dokau-pu:final
		;;
	final)
		sudo docker run -p 6080:80 -p 5900:5900 -e RESOLUTION=$RESOLUTION -v /dev/shm:/dev/shm --name dokau --hostname linux --cgroup-parent $CGNAME --device /dev/snd:/dev/snd --group-add $(getent group audio | cut -d: -f3) --device /dev/video0:/dev/video0 --group-add $(getent group video | cut -d: -f3) nkpro/dokau-pu:final
		;;
	stop)
		sudo docker stop dokau
		;;
	start)
		sudo docker start dokau
		;;
	*)
		sudo docker ps -a && echo && sudo docker images
		;;
esac

