#!/bin/bash

. ~/.bash_variables

touch $scriptsdir/$1.sh 
echo "#!/bin/bash" >> $scriptsdir/$1.sh
vim $scriptsdir/$1.sh
