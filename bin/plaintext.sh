#!/bin/sh 

# from the pure sh bible; see: 
# https://github.com/dylanaraps/pure-sh-bible#get-the-base-name-of-a-file-path
basename() {
    dir=${1%${1##*[!/]}}
    dir=${dir##*/}
    dir=${dir%"$2"}
    base="${dir:-/}"
}


mkdir "build/txt/"

for p in pages/blog/*.md; do
    basename "$p"
    no_ext="${base%.*}"
#    [ "$base" != "_index.md" ] && {
#        pandoc --quiet -s -f "markdown+gutenberg" \
#            "$p" -o "pages/txt/$no_ext.txt"
#    }
    cp "$p" "build/txt/$no_ext.txt"
done
