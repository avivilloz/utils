#!/bin/bash

. ~/.variables

script=""
if [ -z $2 ]; then
    script=$scriptsdir/$1.sh
else
    scriptdir=$scriptsdir/$1
    script=$scriptdir/$2.sh
    if [ ! -d "$scriptdir"  ]; then
        mkdir "$scriptdir"
    fi
    if [ ! -f $script ]; then
        echo "#!/bin/bash" >> $script
    fi
fi

$edit $edit_flags $script
