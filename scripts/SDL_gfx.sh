test_deps_install SDL
get_pspport SDL_gfx SDL_gfx-psp

# replace extremely old config.guess files that are missing aarch64 / arm64
find . -name "config.guess" -exec cp $basepath/new-config.guess {} \;

run_autogen_build --with-sdl-prefix=$(psp-config --psp-prefix) \
  --disable-mmx
