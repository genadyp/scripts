#!/usr/bin/env bash

# http://stackoverflow.com/questions/1261716/help-getting-conky-to-work-with-lxde-pcmanfm
# Follow Redsandro's advice and sudo apt-get install xdotool and create some
# conky-remap.sh (or whatever) script in your /usr/local/bin (or wherever)
# directory. Also, install wmctrl if you do not already have it.
# We will be using this to make Conky active
# (I know this is different than mapping, but it behaves as I expect it to,
# so I'm not worried.)

# Run wmctrl -l to list all windows while Conky is running and take note of
# Conky's title (mine was something like Conky (<my-machine-name>).

# While you're at it create another file in which we will save the current state
# of the desktop (0=not show-desktop-mode, 1=show-desktop-mode... almost) called
# something like .conky_desktop_state. I have put this into /usr/local/bin as well.

# wmctrl's command to activate a window doesn't care about the desktop being in
# focus or not, so we don't need to sleep or flash a dialog window to the screen.
# $state and $dt are the variables which hold the current state of the desktop
# (again, kind of) and the current desktop id number.

# xdotool search --desktop $dt . windowmap %@ maps all of the windows from the
# current desktop back to the screen and leaves other desktops alone.

# Edit ~/.config/openbox/lubuntu-rc.xml or wherever to execute the script when
# Win+D is pressed.
# <keybind key="W-d">
  # <action name="ToggleShowDesktop"/>
  # <action name="Execute">
    # <command>conky-remap.sh</command>
  # </action>
# </keybind>

# openbox --reconfigure to refresh keybindings and you should be good to go.

# With Win-D to show desktop, the desktop is focused, so you may use arrow keys to
# navigate desktop icons.

# This solution does have its own set of quirks:
    # * A second pressing of Win+D brings up all windows of the current desktop,
    # not just the ones which were active before showing the desktop.
    # * A toggle is stored in .conky_desktop_state, but it doesn't really match up
    # with show-desktop-mode since it only toggles when the script is executed.
    # This means it is possible to have one desktop shown and the other not.
    # In this case, the desktop will be shown briefly and then all windows will be
    # brought active. One more pressing Win+D will show the desktop.
    # * Sometimes the whole thing fails and Conky disappears with all of the other
    # windows, albeit rarely. Just cat /usr/.../.conky_desktop_state and toggle
    # the opposite value in (ie- echo 1 > /usr/.../.conky_desktop_state)
    # * Although most of the time the last active window before Win+D is on top
    # after a second Win+D, it is not necessarily active, meaning you may have to
    # click in the window or Alt+Tab to it to start typing in it. This generally
    # is the case with terminal windows.

# Ideally, we would be able to look at all active (mapped) windows on each desktop
# individually and execute one or the other command based on if Conky is the only
# active window.

#conky_name=myconky
#state_file=/home/genadyp/.conky/.conky_desktop_state
#state=$(cat $state_file)
#dt=$(xdotool get_desktop)

#if (( $state == 1 )) ; then
  #echo 0 > $state_file
  #wmctrl -a "myconky"
#else
  #echo 1 > $state_file
  #wmctrl -a "myconky"
  #xdotool search --desktop $dt . windowmap %@
#fi

#zenity --info --text "Remapping Conky..." &
#pid=$!
#sleep 0.3
#kill $pid
#xdotool windowmap `xdotool search --classname 'Conky'`

kill -2 `pidof conky`
conky -d

