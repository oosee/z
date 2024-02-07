#!/bin/bash
#
# Lisence: MIT
#
# File name: part-mini.sh
#
# Description: DIY Script Part
#

echo "开始 DIY 配置..."
echo "===================="

function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

# 修改默认IP
sed -i 's/192.168.1.1/192.168.2.2/g' package/base-files/files/bin/config_generate

# 更改Shell
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# TTYD免登录
# sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# 拉取软件包
git_sparse_clone main https://github.com/oosee/o luci-app-adguardhome
git_sparse_clone main https://github.com/oosee/o luci-app-eqosplus
rm -rf feeds/luci/applications/luci-app-netdata
git_sparse_clone main https://github.com/oosee/o luci-app-netdata

# OpenClash
git_sparse_clone master https://github.com/vernesong/OpenClash luci-app-openclash
# AndPo2lmo
pushd package/luci-app-openclash/tools/po2lmo
make && sudo make install
popd

# SSR-Plus
git clone --depth=1 -b main https://github.com/fw876/helloworld package/luci-app-ssr-plus

# PassWall
# git clone --depth=1 -b main https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall
# git clone --depth=1 -b main https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
# git clone --depth=1 -b main https://github.com/xiaorouji/openwrt-passwall2 package/luci-app-passwall2

# MosDNS
rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/applications/luci-app-mosdns
git_sparse_clone v5 https://github.com/sbwml/luci-app-mosdns mosdns
git_sparse_clone v5 https://github.com/sbwml/luci-app-mosdns luci-app-mosdns

# Onliner
git_sparse_clone main https://github.com/oosee/o luci-app-onliner
sed -i '$i uci set nlbwmon.@nlbwmon[0].refresh_interval=10s' package/lean/default-settings/files/zzz-default-settings
sed -i '$i uci commit nlbwmon' package/lean/default-settings/files/zzz-default-settings

# Amlogic
git_sparse_clone main https://github.com/ophub/luci-app-amlogic luci-app-amlogic

# Themes
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
git_sparse_clone main https://github.com/oosee/o luci-theme-argon
git_sparse_clone main https://github.com/oosee/o luci-app-argon-config
git_sparse_clone main https://github.com/oosee/o luci-theme-edge
git_sparse_clone main https://github.com/oosee/o luci-theme-ifit

# 更改主题背景
cp -f $GITHUB_WORKSPACE/images/bg1.jpg package/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# 取消主题设置
find package/luci-theme-*/* -type f -name '*luci-theme-*' -print -exec sed -i '/set luci.main.mediaurlbase/d' {} \;

# 修改默认主题
# sed -i 's/luci-theme-bootstrap/luci-theme-ifit/g' feeds/luci/collections/luci/Makefile

# x86只显示CPU
sed -i 's/${g}.*/${a}${b}${c}${d}${e}${f}${hydrid}/g' package/lean/autocore/files/x86/autocore

# 修改时间格式
sed -i 's/os.date()/os.date("%a %Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm

# 修改版本日期
date_version=$(date +"%y.%m.%d")
orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
sed -i "s/${orig_version}/R${date_version} by Zz/g" package/lean/default-settings/files/zzz-default-settings

# 修复Hostapd
cp -f $GITHUB_WORKSPACE/scripts/011-fix-mbo-modules-build.patch package/network/services/hostapd/patches/011-fix-mbo-modules-build.patch

# 修复其他错误
sed -i 's|TARGET_CFLAGS += -DHAVE_MAP_SYNC.*|TARGET_CFLAGS += -DHAVE_MAP_SYNC $(if $(CONFIG_USE_MUSL),-D_LARGEFILE64_SOURCE)|' feeds/packages/utils/xfsprogs/Makefile

# 修改Makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/luci.mk/$(TOPDIR)\/feeds\/luci\/luci.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/lang\/golang\/golang-package.mk/$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang-package.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHREPO/PKG_SOURCE_URL:=https:\/\/github.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload.github.com/g' {}

# Docker>服务
sed -i 's/"admin"/"admin", "services"/g' feeds/luci/applications/luci-app-dockerman/luasrc/controller/dockerman.lua
sed -i 's/"admin"/"admin", "services"/g; s/admin\//admin\/services\//g' feeds/luci/applications/luci-app-dockerman/luasrc/model/cbi/dockerman/*.lua
sed -i 's/admin\//admin\/services\//g' feeds/luci/applications/luci-app-dockerman/luasrc/view/dockerman/*.htm
sed -i 's|admin\\|admin\\/services\\|g' feeds/luci/applications/luci-app-dockerman/luasrc/view/dockerman/container.htm

# 调整插件排序
sed -i 's/_("Frp Setting"), 100/_("Frp Setting"), 60/g' feeds/luci/applications/luci-app-frpc/luasrc/controller/frp.lua
sed -i 's/_("KMS Server"), 100/_("KMS Server"), 101/g' feeds/luci/applications/luci-app-vlmcsd/luasrc/controller/vlmcsd.lua

# 更改插件名字
sed -i 's/"TTYD 终端"/"TTYD"/g' `egrep "TTYD 终端" -rl ./`
sed -i 's/"Argon 主题设置"/"主题设置"/g' `egrep "Argon 主题设置" -rl ./`
sed -i 's/"ShadowSocksR Plus+"/"ShadowSocksR Plus"/g' `egrep "ShadowSocksR Plus+" -rl ./`
sed -i 's/"Frp 内网穿透"/"Frpc"/g' `egrep "Frp 内网穿透" -rl ./`
sed -i 's/"KMS 服务器"/"KMS Server"/g' `egrep "KMS 服务器" -rl ./`
sed -i 's/"网络存储"/"存储"/g' `egrep "网络存储" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `egrep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"带宽监控"/"带宽"/g' `egrep "带宽监控" -rl ./`
sed -i 's/"网速监控"/"网速"/g' `egrep "网速监控" -rl ./`
sed -i 's/"实时流量监测"/"流量"/g' `egrep "实时流量监测" -rl ./`

./scripts/feeds update -a
./scripts/feeds install -a

echo "===================="
echo "结束 DIY 配置..."
