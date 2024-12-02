sudo apt install qemu-system binfmt-support qemu-user-static
docker run --rm --privileged tonistiigi/binfmt --install all
docker run -v $(pwd):/sources --platform=linux/arm64/v8 -it --rm haskell:9.6-slim-bullseye 'bash -c "cd /sources/pandoc-cli && cabal update && cabal build -fembed_data_files -flua"'
