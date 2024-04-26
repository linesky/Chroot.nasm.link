printf "\x1bc\x1b[43;37m"
roots=$(pwd)/roots
tmps=/tmp/lists.txt
tmps2=/tmp/lists2.txt
nasm -f elf32 hello.asm -o hello.o
ld  -dynamic-linker /lib/i386-linux-gnu/ld-linux.so.2 /lib/i386-linux-gnu/libc.so.6 /lib/i386-linux-gnu/libc.a hello.o -o hello
mkdir -p $roots
mkdir -p $roots/usr
mkdir -p $roots/usr/bin
mkdir -p $roots/bin
mkdir -p $roots/tmp
mkdir -p $roots/lib
mkdir -p $roots/dev
mkdir -p $roots/boot
mkdir -p $roots/proc
mkdir -p $roots/proc/self
mkdir -p $roots/usr/include
mkdir -p $roots/lib/i386-linux-gnu
cp /lib/i386-linux-gnu/ld-linux.so.* $roots/lib/i386-linux-gnu/
cp /lib/i386-linux-gnu/libc.so.* $roots/lib/i386-linux-gnu/
cp  /lib/i386-linux-gnu/crt*.* $roots/lib/i386-linux-gnu/
cp  /usr/include/*.* $roots/usr/include
cp  ./hello.c $roots/usr/bin
cp  ./compile.sh $roots/bin
cp  ./compile.sh $roots/usr/bin
cp  ./hello.asm $roots/bin
cp  ./hello.asm $roots/usr/bin
cp  ./hello.c $roots/bin
cp  /lib/i386-linux-gnu/libc.a $roots/usr/bin
cp  /lib/i386-linux-gnu/libc.a $roots/bin
cp  /lib/i386-linux-gnu/libc.a $roots/lib/i386-linux-gnu/
cp  /usr/bin/bash $roots/usr/bin
cp  /usr/bin/bash $roots/bin
cp  /usr/bin/ld $roots/usr/bin
cp  /usr/bin/ld $roots/bin
cp  /usr/bin/nasm $roots/usr/bin
cp  /usr/bin/nasm $roots/bin
cp  /usr/bin/as $roots/usr/bin
cp  /usr/bin/as $roots/bin
cp  /usr/bin/sh $roots/usr/bin
cp  /usr/bin/sh $roots/bin
cp  /usr/bin/sh $roots/usr/bin
cp  /usr/bin/sh $roots/bin
cp  /usr/bin/ls $roots/usr/bin
cp  /usr/bin/ls $roots/bin
cp  /usr/bin/ldd $roots/usr/bin
cp  /usr/bin/ldd $roots/bin
printf "" > $roots/dev/null
printf "" > $roots/dev/stdio
printf "" > $roots/dev/stdout
printf "" > $roots/dev/stdin
chmod 777 $roots/bin/*
chmod 777 $roots/usr/bin/*
printf "" > $tmps
list1=$(ls $roots/usr/bin/*)
for l1 in $list1
do
ldd "$l1" | grep  '/lib/' >> $tmps
done
awk '{for(i=1;i<=NF;i++) if($i ~ /\/lib\//) print $i}' $tmps > $tmps2
while IFS= read -r l1
do

rt="$roots$l1"
cp "$l1" "$rt" 
done < "$tmps2"




