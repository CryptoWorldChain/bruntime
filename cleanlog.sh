#!/bin/sh
#rm -rf logs/*.log

ROOT=`dirname "$0"`
echo $ROOT

rm -rf $ROOT/logs/*.log
