#!/bin/sh

case "$1" in 
        start)
                echo "aesdsocket is starting"
                start-stop-deamon -S -n aesdsocket -a /usr/bin/aesdsocket -- -d 
                ;;
        stop) 
                echo " aesdsocket is stopping"
                start-stop-daemon -K -n aesdsocket 
                ;;

        *)
                echo "Please use : $0 {start|stop}"

        exit 1 

esac

exit 0