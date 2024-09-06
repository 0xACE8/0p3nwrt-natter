#!/bin/bash
function git_clone() {
  git clone --depth 1 $1 $2 || true
 }
function git_sparse_clone() {
  branch="$1" rurl="$2" localdir="$3" && shift 3
  git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
  cd $localdir
  git sparse-checkout init --cone
  git sparse-checkout set $@
  mv -n $@ ../
  cd ..
  rm -rf $localdir
  }
function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}
git clone --depth 1 https://github.com/kiddin9/openwrt-packages natterx2 && mv -n natterx2/natter2 ./;rm -rf natterx2
git clone --depth 1 https://github.com/kiddin9/openwrt-packages lanatter2 && mv -n lanatter2/luci-app-natter2  ./; rm -rf lanatter2

exit 0
