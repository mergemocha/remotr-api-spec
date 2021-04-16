#!/bin/bash
# Reformats relative URLs in the index.html file to absolute URLs pointing to GitHub

set -e

mkdir build
cp ./docs/* build
sed 's+../spec/Server.v1.json+https://raw.githack.com/mergemocha/remotr-api-spec/master/spec/Server.v1.json+' build/index.html | tee build/index.html
sed 's+../spec/Daemon.v1.json+https://raw.githack.com/mergemocha/remotr-api-spec/master/spec/Daemon.v1.json+' build/index.html | tee build/index.html
