wget --continue --no-check-certificate https://github.com/fungos/smpeg-psp/tarball/master -O smpeg-psp.tar.gz
rm -Rf smpeg-psp && mkdir smpeg-psp && tar --strip-components=1 --directory=smpeg-psp -xvzf smpeg-psp.tar.gz
cd smpeg-psp

# replace extremely old config.guess files that are missing aarch64 / arm64
find . -name "config.guess" -exec cp $basepath/new-config.guess {} \;

apply_patch smpeg-psp
sed -i -e "s/static __inline__ Uint16 SDL_Swap16(Uint16 x)/static __inline__ Uint16 Disable_SDL_Swap16(Uint16 x)/" audio/*.cpp || { exit 1; }
run_make -j `num_cpus`

