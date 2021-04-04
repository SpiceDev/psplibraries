clone_git_repo github.com albe libpspvram
cd libpspvram

# replace extremely old config.guess files that are missing aarch64 / arm64
find . -name "config.guess" -exec cp $basepath/new-config.guess {} \;

run_make
