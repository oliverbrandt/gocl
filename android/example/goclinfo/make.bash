#!/usr/bin/env bash
# Copyright 2014 The Go Authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -e

if [ ! -f make.bash ]; then
	echo 'make.bash must be run from $GOPATH/src/code.google.com/p/go.mobile/example/basic'
	exit 1
fi

mkdir -p jni/armeabi
CGO_ENABLED=1 GOOS=android GOARCH=arm GOARM=7 \
	go build -tags="cl11" -ldflags="-shared" -o jni/armeabi/libgoclinfo.so .
ndk-build NDK_DEBUG=1
ant debug
