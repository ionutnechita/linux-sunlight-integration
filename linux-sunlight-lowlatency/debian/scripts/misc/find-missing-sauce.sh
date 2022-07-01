#!/bin/bash
#
# Find the 'SUNLIGHT: SAUCE:' patches that have been dropped from
# the previous release.
#
PREV_REPO=https://github.com/ionutnechita/linux-sunlight.git

git fetch ${PREV_REPO} 5.18
git log --pretty=oneline FETCH_HEAD|grep SAUCE|while read c m;do echo $m;done |sort > $$.prev-rel
git log --pretty=oneline |grep SAUCE|while read c m;do echo $m;done |sort > $$.curr-rel

diff -u $$.prev-rel $$.curr-rel |grep "^-"
rm -f $$.prev-rel $$.curr-rel

