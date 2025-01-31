path=$(pm list packages -f | grep icu.nullptr.nativetest | sed 's/package://' | awk -F'base' '{print $1}')

find $path -type f -name "*.*dex" -exec rm {} \;