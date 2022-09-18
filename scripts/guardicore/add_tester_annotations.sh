#!/bin/bash

. ~/.variables
. ~/.session_variables

vim $scriptsdir/guardicore/add_tester_annotations.py
$python_version $scriptsdir/guardicore/add_tester_annotations.py
