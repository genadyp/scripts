#!/bin/bash

# This script fixes hiddeen gnome-panel disabled after start-up
# Need to add similar line to Startup menu:
# gnome-terminal -e "/some_path/myapp1 -arg1 - arg2"

#sh -c "gconftool-2 -s -t bool /apps/panel/toplevels/panel_0/auto_hide false; gconftool-2 -s -t bool /apps/panel/toplevels/panel_0/auto_hide true"
gconftool-2 -s -t bool /apps/panel/toplevels/panel_0/auto_hide false; 
#gconftool-2 -s -t bool /apps/panel/toplevels/panel_0/auto_hide true

