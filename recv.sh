case ${1} in
"")
sudo x86_64-softmmu/qemu-system-x86_64 \
-drive if=none,id=drive0,cache=none,format=raw,file=/home/ken/cuju/Ubuntu20G-1604.img \
-device virtio-blk,drive=drive0 \
-m 1G -enable-kvm \
-net tap,ifname=tap1 -net nic,model=virtio,vlan=0,macaddr=ae:ae:00:00:00:25 \
-vga std -chardev socket,id=mon,path=/home/ken/vm1r.monitor,server,nowait -mon chardev=mon,id=monitor,mode=readline \
-cpu host \
-incoming tcp:0:4441,ft_mode
;;

"gdb")
sudo gdb -ex 'set confirm off' --args x86_64-softmmu/qemu-system-x86_64 \
-drive if=none,id=drive0,cache=none,format=raw,file=/home/ken/cuju/Ubuntu20G-1604.img \
-device virtio-blk,drive=drive0 \
-m 1G -enable-kvm \
-net tap,ifname=tap1 -net nic,model=virtio,vlan=0,macaddr=ae:ae:00:00:00:25 \
-vga std -chardev socket,id=mon,path=/home/ken/vm1r.monitor,server,nowait -mon chardev=mon,id=monitor,mode=readline \
-cpu host \
-incoming tcp:0:4441,ft_mode
;;
*)
    echo "choose gdb or not"
;;
esac

