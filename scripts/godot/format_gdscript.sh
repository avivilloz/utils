#!/bin/bash

. ~/.session_variables

editor_layout_path="$godot_project_path/.godot/editor/editor_layout.cfg"
regex='selected_script="res://([^"]*)"'
script_local_path=$(grep -Po "$regex" "$editor_layout_path" | sed -nE 's|'"$regex"'|\1|p')
script_global_path="$godot_project_path/$script_local_path"

echo "Script to be formatted: $script_global_path"

gdformat $script_global_path
