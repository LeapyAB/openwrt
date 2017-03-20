#!/bin/sh

# Move easyserv feeds into the build-dir
cp easyserv/feeds.conf ./feeds.conf

# Run the feeds updates
./scripts/feeds update -a
./scripts/feeds install -a

# Link base-config to the files dir
rm files
ln -s feeds/easyservgw/base-config/files files

# Copy easyservconfig into the build-dir
cp easyserv/config .config

make defconfig

make -j8
  
