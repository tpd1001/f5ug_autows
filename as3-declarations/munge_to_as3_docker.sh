#!/bin/bash

sed=$(which gsed)
#case `uname` in SunOS)sed=gsed;;Linux)sed=sed;;Darwin)sed=sed;bak=.orig;;esac
#case `uname` in SunOS)sed=gsed;;Linux)sed=sed;;Darwin)sed=sed;bak=.orig;;esac
tmp=/tmp/$(basename ${1?})

$FAKE ${sed} '/class.*AS3/{
n
a\
"targetHost": "108.128.216.12",\
"targetUsername": "admin",\
"targetPassphrase": "admin",
}
' ${1?} | ${sed} "/targetPassphrase/s/admin/${passwd?}/" > $tmp
# curl does not work with -d <filename> in any of my attempts so far
# so just display the munged json instead
cat $tmp
