# output ripped from:
# > ./configure --cpu=x86
# > make

# to see the actual commands, use bash with debug output: bash -x ./doit_32.sh

# https://github.com/kripken/emscripten/issues/2355
# without --llvm-opts, error: aborting from js compiler due to exception: unknown vector type <4 x i1> | undefined

emcc -o tcc.o -c tcc.c -DCONFIG_LDDIR="\"lib/x86_64-linux-gnu\"" -DCONFIG_MULTIARCHDIR="\"x86_64-linux-gnu\"" -DTCC_TARGET_I386 -I.  -Wall -g -O2 -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result              --llvm-opts "['-O2', '-disable-slp-vectorization', '-disable-loop-vectorization', '-disable-loop-unrolling']"
emcc -o libtcc.o -c libtcc.c -DCONFIG_LDDIR="\"lib/x86_64-linux-gnu\"" -DCONFIG_MULTIARCHDIR="\"x86_64-linux-gnu\"" -DTCC_TARGET_I386 -I.  -Wall -g -O2 -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result        --llvm-opts "['-O2', '-disable-slp-vectorization', '-disable-loop-vectorization', '-disable-loop-unrolling']"
emcc -o tccpp.o -c tccpp.c -DCONFIG_LDDIR="\"lib/x86_64-linux-gnu\"" -DCONFIG_MULTIARCHDIR="\"x86_64-linux-gnu\"" -DTCC_TARGET_I386 -I.  -Wall -g -O2 -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result          --llvm-opts "['-O2', '-disable-slp-vectorization', '-disable-loop-vectorization', '-disable-loop-unrolling']"
emcc -o tccgen.o -c tccgen.c -DCONFIG_LDDIR="\"lib/x86_64-linux-gnu\"" -DCONFIG_MULTIARCHDIR="\"x86_64-linux-gnu\"" -DTCC_TARGET_I386 -I.  -Wall -g -O2 -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result        --llvm-opts "['-O2', '-disable-slp-vectorization', '-disable-loop-vectorization', '-disable-loop-unrolling']"
emcc -o tccelf.o -c tccelf.c -DCONFIG_LDDIR="\"lib/x86_64-linux-gnu\"" -DCONFIG_MULTIARCHDIR="\"x86_64-linux-gnu\"" -DTCC_TARGET_I386 -I.  -Wall -g -O2 -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result        --llvm-opts "['-O2', '-disable-slp-vectorization', '-disable-loop-vectorization', '-disable-loop-unrolling']"
emcc -o tccasm.o -c tccasm.c -DCONFIG_LDDIR="\"lib/x86_64-linux-gnu\"" -DCONFIG_MULTIARCHDIR="\"x86_64-linux-gnu\"" -DTCC_TARGET_I386 -I.  -Wall -g -O2 -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result        --llvm-opts "['-O2', '-disable-slp-vectorization', '-disable-loop-vectorization', '-disable-loop-unrolling']"
emcc -o tccrun.o -c tccrun.c -DCONFIG_LDDIR="\"lib/x86_64-linux-gnu\"" -DCONFIG_MULTIARCHDIR="\"x86_64-linux-gnu\"" -DTCC_TARGET_I386 -I.  -Wall -g -O2 -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result        --llvm-opts "['-O2', '-disable-slp-vectorization', '-disable-loop-vectorization', '-disable-loop-unrolling']"
emcc -o i386-gen.o -c i386-gen.c -DCONFIG_LDDIR="\"lib/x86_64-linux-gnu\"" -DCONFIG_MULTIARCHDIR="\"x86_64-linux-gnu\"" -DTCC_TARGET_I386 -I.  -Wall -g -O2 -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result    --llvm-opts "['-O2', '-disable-slp-vectorization', '-disable-loop-vectorization', '-disable-loop-unrolling']"
emcc -o i386-asm.o -c i386-asm.c -DCONFIG_LDDIR="\"lib/x86_64-linux-gnu\"" -DCONFIG_MULTIARCHDIR="\"x86_64-linux-gnu\"" -DTCC_TARGET_I386 -I.  -Wall -g -O2 -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result    --llvm-opts "['-O2', '-disable-slp-vectorization', '-disable-loop-vectorization', '-disable-loop-unrolling']"
emar rcs libtcc.a libtcc.o tccpp.o tccgen.o tccelf.o tccasm.o tccrun.o i386-gen.o i386-asm.o
emcc -o tcc.html tcc.o libtcc.a -lm -ldl -I.  -Wall -g -O2 -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result

 # make -C lib native
 # cd /home/kung/public_html/tcc-0.9.26/lib
 # mkdir -p i386
 # gcc -c libtcc1.c -o i386/libtcc1.o -I..  -Wall -g -O2 -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result -DTCC_TARGET_I386
 # gcc -c alloca86.S -o i386/alloca86.o -I..  -Wall -g -O2 -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result -DTCC_TARGET_I386
 # #alloca86.S: Assembler messages:
 # #alloca86.S:7: Error: operand type mismatch for `pop'
 # #alloca86.S:8: Error: operand type mismatch for `pop'
 # #alloca86.S:27: Error: operand type mismatch for `push'
 # #alloca86.S:28: Error: operand type mismatch for `push'
 # #make[1]: *** [i386/alloca86.o] Error 1
 # cd ..
 # #make: *** [libtcc1.a] Error 2
 # #root@ubuntu:/home/kung/public_html/tcc-0.9.26# ./tcc -v
 # #tcc version 0.9.26 (i386 Linux)
