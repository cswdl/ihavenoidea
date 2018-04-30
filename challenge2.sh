mkdir -p isodir/boot/grub
cp ihavenoidea.bin isodir/boot/ihavenoidea.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o ihavenoidea.iso isodir
