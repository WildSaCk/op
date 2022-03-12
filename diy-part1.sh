#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#openclash，在menuconfig的时候选上luci-compat
git clone https://github.com/vernesong/OpenClash.git package/test --depth 1
mv package/test/luci-app-openclash package/luci-app-openclash
rm -rf package/test

#serverchan
git clone --depth 1 https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan

#fullcone
cd
git clone --depth 1 -b master --single-branch https://github.com/coolsnowwolf/lede.git
mv lede/package/lean/openwrt-fullconenat /workdir/openwrt/package/openwrt-fullconenat
cd /workdir/openwrt

#argon
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

#adguard
git clone --depth 1 https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

#diskman
git clone --depth 1 https://github.com/lisaac/luci-app-diskman.git package/test
mv package/test/applications/luci-app-diskman package/luci-app-diskman
mkdir -p package/parted
mv package/test/Parted.Makefile package/parted/Makefile
rm -rf package/test

#filetransfer
git clone --depth 1 https://github.com/Porcat/luci-app-filetransfer.git package/luci-app-filetransfer