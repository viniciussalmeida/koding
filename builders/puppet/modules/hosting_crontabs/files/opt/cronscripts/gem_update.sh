#!/bin/bash

/usr/bin/gem update  -u --no-ri --no-rdoc | grep 'Successfully installed' &
/opt/ruby19/bin/gem1.9 update  -u --no-ri --no-rdoc --format-executable  | grep 'Successfully installed' &


rc=0
for job in $(jobs -p) 
do
    wait $job || rc=$(($rc+$?))
done

if [[ $rc -lt 2 ]]; then
    echo "updating gems"
    /usr/sbin/cagefsctl --update
fi
