#!/bin/bash
#
# Lisence: MIT
#
# File name: part-k2p.sh
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
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# TTYD免登录
# sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# 拉取软件包
git_sparse_clone main https://github.com/oosee/o luci-app-eqosplus

# SSR-Plus
git clone --depth=1 -b main https://github.com/fw876/helloworld package/luci-app-ssr-plus

# Onliner
git_sparse_clone main https://github.com/oosee/o luci-app-onliner
sed -i '$i uci set nlbwmon.@nlbwmon[0].refresh_interval=2s' package/lean/default-settings/files/zzz-default-settings
sed -i '$i uci commit nlbwmon' package/lean/default-settings/files/zzz-default-settings

# Themes
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
git_sparse_clone main https://github.com/oosee/o luci-theme-argon
git_sparse_clone main https://github.com/oosee/o luci-app-argon-config

# 更改主题背景
cp -f $GITHUB_WORKSPACE/images/bg1.jpg package/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# 取消主题设置
find package/luci-theme-*/* -type f -name '*luci-theme-*' -print -exec sed -i '/set luci.main.mediaurlbase/d' {} \;

# 修改默认主题
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改时间格式
sed -i 's/os.date()/os.date("%a %Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm

# 修改主机名称
# sed -i "s/hostname='OpenWrt'/hostname='OpenK2P'/g" package/base-files/files/bin/config_generate
# cat package/base-files/files/bin/config_generate |grep hostname=

# 移除跑分信息
# sed -i 's/ <%=luci.sys.exec("cat \/etc\/bench.log") or ""%>//g' package/lean/autocore/files/arm/index.htm

# 修改upnp位置
sed -i 's/\/var\/upnp.leases/\/tmp\/upnp.leases/g' feeds/packages/net/miniupnpd/files/upnpd.config
cat feeds/packages/net/miniupnpd/files/upnpd.config |grep upnp_lease_file

# 修改版本日期
date_version=$(date +"%y.%m.%d")
orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
sed -i "s/${orig_version}/R${date_version} by Zz/g" package/lean/default-settings/files/zzz-default-settings

# ZeroTier服务
sed -i 's/vpn/services/g; s/VPN/Services/g' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua
sed -i 's/vpn/services/g' feeds/luci/applications/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm

# 调整插件排序
sed -i 's/_("ZeroTier"), 99/_("ZeroTier"), 20/g' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua
sed -i 's/_("KMS Server"), 100/_("KMS Server"), 101/g' feeds/luci/applications/luci-app-vlmcsd/luasrc/controller/vlmcsd.lua

# 更改插件名字
sed -i 's/"TTYD 终端"/"TTYD"/g' `egrep "TTYD 终端" -rl ./`
sed -i 's/"Argon 主题设置"/"主题设置"/g' `egrep "Argon 主题设置" -rl ./`
sed -i 's/"ShadowSocksR Plus+"/"ShadowSocksR Plus"/g' `egrep "ShadowSocksR Plus+" -rl ./`
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
