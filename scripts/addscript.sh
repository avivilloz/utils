#!/bin/bash

. ~/.bash_variables

touch $cfgscriptsdir/$1.sh 
echo "#!/bin/bash" >> $cfgscriptsdir/$1.sh
vim $cfgscriptsdir/$1.sh
