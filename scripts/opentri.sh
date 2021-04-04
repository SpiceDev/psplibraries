test_deps_install zlib freetype

wget --continue --no-check-certificate https://github.com/SamRH/openTRI/tarball/master -O openTRI.tar.gz
rm -Rf openTRI && mkdir openTRI && tar --strip-components=1 --directory=openTRI -xvzf openTRI.tar.gz
cd openTRI

# replace extremely old config.guess files that are missing aarch64 / arm64
find . -name "config.guess" -exec cp ../../new-config.guess {} \;

CP=cp MKDIR=mkdir DOXYGEN=doxygen PNG=1 FT=1 run_make -j `num_cpus`
