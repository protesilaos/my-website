---
title: "Running i3 on Debian stretch"
subtitle: "Tilling windows are a joy"
excerpt: "The i3 window manager offers a very efficient workflow for keyboard-centric use."
date: 2017-06-10
permalink: /codelog/i3-gaps-debian/
---
**UPDATE 2018-06-23:** This post is out of date.<br/>
I currently use a highly customised environment around `bspwm`. As for this article, I have added an Annex with an annotated version of my latest `i3-gaps` config file. You will need to have a close look at it and make adaptations where necessary.<br/>
**UPDATE 2019-07-06:** I actually have a free/libre book on how to set up my BSPWM setup: [Prot's Dots For Debian](https://protesilaos.com/pdfd)
{:.critical}

My favourite desktop environment is Xfce. It is lightweight, customisable, and strikes the right balance between stability and usability. The one area where I find it somewhat constraining is on window placement. The options provide for either an effectively random placement of new windows on the screen, or for them to appear at the centre. On a large monitor either option is suboptimal. Random placement introduces a noticeable mental disconnect of trying to anticipate the position of the new window. While central positioning grows inefficient when opening multiple applications, since each new window has to be moved out of the other's way.

Xfce's default window manager follows a 'stacking' paradigm. Windows are piled on top of each other. Two or more windows can cover the same screen region. The onus of window management thus falls on the user. They need to use `Alt+Tab` or click the relevant window button on the panel in order to get to where they want. This is a traditional approach that perfectly suited smaller monitors of the past. In our age though, where 24" and higher screens are all too common, there is no practical necessity to run a stacking window manager. We can instead instruct the display server to position windows next to each other, saving us from the extra effort.

That is where programs such as i3 come into play. This is a window manager whose headline feature is the 'tilling' placement of applications. Equally important is its keyboard-centric approach. One can use i3 with virtually no mouse interaction. All operations on the workspace can be done with a few simple key strokes, from opening windows, to moving/tiling them in the desired place, to adjusting their relative widths. Working on a large monitor and making best use of its expansive real estate, becomes part of the ordinary computing experience.

On a small canvas, the added value of tiling windows is partially lost, especially for applications such as the web browser that will only display a portion of the whole website (since many are not well designed for narrower viewports). But with a monitor above 21", it is very convenient to run two windows side by side or have a 2x2 grid that does not detract from the overall experience. For terminals, this is even more so, since the text will always fit the viewport.

## i3 with gaps

My new monitor is 27" on the diagonal. Running a tiling window manager on it is the best choice I could make. Window placement is predictable, while the large screen can easily accommodate several applications running on the same desktop. Combined with a smooth way of handling workspaces (virtual desktops), i3 offers all one needs to get things done from the comfort of their keyboard.

The only limitation of i3 proper is its lack of some essential features, most notably the option to have gaps between windows and margins on the workspace. The [i3-gaps fork](https://github.com/Airblader/i3) rectifies that, while adding a straightforward way to resize gaps on the fly and even to predefine gaps for specific workspaces. Having tried both i3 and i3-gaps, I can only the recommend the latter, especially on larger monitors (though technically one can run it on small screens just as fine).

## Debian does not offer i3-gaps

The official repos only include the main i3 package. To get the fork with the gaps one needs to compile it from source. The maintainer's instructions are clear and easy to follow. Getting i3 with gaps on Debian stretch (still the current testing) only takes a few minutes.

Fortunately enough, Debian repos do include other pieces of software that are useful to a comprehensive i3 setup, namely, `rofi`, `i3blocks`, and `feh`. To that mix we might as well add `compton`, `unclutter`, and `setxkbmap`.

## Worth the time investment

It took me about a day to get things configured the way I want them, while I am still tweaking some minor things here and there. This might seem like a huge investment in time and effort, but in truth it is comparable to the time I need to customise my Xfce desktop.

With about a full week on i3-gaps I can confidently claim that a tilling window manager is the best option for a workflow that (i) focuses on the keyboard, (ii) makes window placement predictable and thus minimises perceived friction, and (iii) is highly customisable and can deliver a very personalised experience.

So here is a screenshot of what I am actually seeing right now.

![i3 gaps sample](/assets/images/attachments/i3-gaps-sample.png)

In the future I might also produce a video to better demonstrate my workflow. In the meantime, feel free to [use my dotfiles](https://gitlab.com/protesilaos/dofiles).

## UPDATE 2018-06-23: Annex

Below is the latest version of my i3 config file with some new comments that might prove useful:

```sh
# vi:ft=i3
# i3 config file (v4)

# UPDATE 2018-06-23
    # IMPORTANT I stopped using i3 about six months ago. Today is 23 June 2018.
    #
    # This config is retrieved from the git history of my dotfiles
    # https://github.com/protesilaos/dotfiles/commit/aba729fed45939b3f1fbf00f68aae67ae784d415
    #
    # This config is updated to provide basic support for this article:
    # https://protesilaos.com/codelog/i3-gaps-debian/ (10 June 2017)
    #
    # All new comments (2018-06-23) start with the term UPDATE and are indented
    #
    # Furthermore, I have replaced all shotcuts that used the Alt key (Mod1).
    # Those would have conflicted with Emacs (and perhaps others).
    # If you do not use Emacs, feel free to replace Shift or Mod4 (Meta).
    #
    # Finally, I have removed the icon paths in the notify-send actions.
    # Those were hard wired to the Papirus icon theme.
    # Bad practice.
    # I recently found out that the icon names can be generic.
    # They will use the active icon theme.
    # Example:
    # notify-send -i firefox "Notification title" "Notification text"
    #
    # Adapt accordingly.

# General settings
# ==============================================================================

# UPDATE 2018-06-23
    # Assign the $mod key to Super (the Windows key)
    # Use Mod1 if you prefer the Alt key
    # The $mod is critical for interacting with the i3 window manager
set $mod Mod4

# UPDATE 2018-06-23
    # This does not seem correct. It was probably placed here by accident.
    # I have commented it out, to avoid any errors. Please test.
    # Also, I recommend you use Hack instead of DejaVu Sans Mono.
    # They are almost the same, but Hack looks a bit cleaner.
# font pango:DejaVu Sans Mono 8

# UPDATE 2018-06-23
    # These are useful if you keep editing the i3 files regularly
    # If I remember correctly, only the `restart` command had guaranteed results.
    # Test it.
# i3 config file
bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart

# Colour scheme
# ------------------------------------------------------------------------------

# UPDATE 2018-06-23
    # If you do not like the following approach, define colours here.
    # Use the following syntax: set $[variable name] [colour hex value]
    # Example:
    # set $black #000000
    #
    # I recommend you have a look at those two pages, if you need inspiration.
    # https://protesilaos.com/schemes
    # https://protesilaos.com/tempus-themes
    #
    # Relying on Xresources is good for using one palette for many programs.
    # But it means you have to edit separate files.
    # You need to keep things well organised. I do that in my current dotfiles.
    # See https://gitlab.com/protesilaos/dotfiles
    #
    # Also, it may not be easy to migrate to Sway (basically i3 for Wayland).
    # Have not tried it, so this is just an assumption (Xresources is for Xorg).


# NOTE XXX Colours are sourced from ~/.Xresources
# Xcolors are defined as `*.color[n]`, which exposes them to any program
# The current setup uses these colours for URxvt, i3, and polybar

# Tempus themes: https://github.com/protesilaos/tempus-themes
# By Protesilaos Stavrou https://protesilaos.com
set_from_resource $col0  color0  #000000
set_from_resource $col1  color1  #000000
set_from_resource $col2  color2  #000000
set_from_resource $col3  color3  #000000
set_from_resource $col4  color4  #000000
set_from_resource $col5  color5  #000000
set_from_resource $col6  color6  #000000
set_from_resource $col7  color7  #000000
set_from_resource $col8  color8  #000000
set_from_resource $col9  color9  #000000
set_from_resource $col10 color10 #000000
set_from_resource $col11 color11 #000000
set_from_resource $col12 color12 #000000
set_from_resource $col13 color13 #000000
set_from_resource $col14 color14 #000000
set_from_resource $col15 color15 #000000

# Common applications
# ------------------------------------------------------------------------------

# UPDATE 2018-06-23
    # You need to adapt the autostarting of the URxvt server.
	# You add this to ~/.xprofile, ~/.profile, or within the i3 config
	# Depends on how you login. Test it.
	#
	# The code for autostarting the URxvt server (if you call it from a shell)
    #
    # # start URxvt server
	# if [ -x /usr/bin/urxvtd ]; then
	#     urxvtd --quiet --opendisplay --fork &
	# fi
    #
    # Within i3 just use:
    # exec --no-startup-id urxvtd --quiet --opendisplay --fork &
    #
	# A very good alternative for URxvt is xfce4-terminal.
    # If you use that, cli programs are called with this:
    # xfce4-terminal -x PROGRAM

# UPDATE 2018-06-23
    # Programs such as qutebrowser and newsboat are not in Debian Stretch
    # You need to change these accordingly
    #
    # Also, the way I defined those variables could probably be improved.
    # For example:
    # set $term TERMINAL
    # set $term-cli TERMINAL -x
    # set $fm $term-cli ranger
    #
    # Cannot test whether this would work. Please test.

# NOTE urxvtd is started with ~/.xprofile, which is sourced from ~/.xinitrc
# NOTE this is necessary for logging in with a display manager
# NOTE the daemon is launched before i3 to speed up the opening of terminals
set $term urxvtc
set $browser qutebrowser
set $fm urxvtc -e ranger
set $rss urxvtc -e newsboat
set $mail urxvtc -e neomutt
set $podcast urxvtc -e podboat -a
set $imageeditor gimp
set $music urxvtc -e ncmpcpp
# UPDATE 2018-06-23
    # The way the $scratchterm is defined here is not portable.
    # It would be easier to have a colour palette with colour variables,
    # source it in an executable, and then assign $scratchterm to the executable.
    #
    # For inspiration see, the way I call the *menu scripts in my current dots:
    # https://gitlab.com/protesilaos/dotfiles/tree/master/bin/bin
set $scratchterm urxvtc -bg '[90]#18161d' -fg '#68b183' -cr '#68b183' -color0 '#18161d' -color1 '#ff7780' -color2 '#68b183' -color3 '#bda014' -color4 '#54a5ff' -color5 '#da89b2' -color6 '#79a8c3' -color7 '#bd9b87' -color8 '#001b1a' -color9 '#ef873d' -color10 '#08b885' -color11 '#d39710' -color12 '#a294fe' -color13 '#ec7aca' -color14 '#4ab0b9' -color15 '#a4a0ac'


# Bar
# ------------------------------------------------------------------------------

# UPDATE 2018-06-23
    # Debian does not have polybar in its repos.
    # A good alternative is i3-blocks.
    # Unfortunately, I forgot how I used to configure it in the below command.
    # What I remember is that it was similar to the default i3 status bar.
    # Please research this.

# Polybar
bar {
        i3bar_command $HOME/.config/polybar/launch.sh
}

# Window settings
# ==============================================================================

# General environment rules
# ------------------------------------------------------------------------------
smart_borders on
# smart_gaps on
gaps inner 20
gaps outer 0
for_window [class="^.*"] border pixel 4
focus_on_window_activation urgent
workspace_auto_back_and_forth yes
force_display_urgency_hint 0 ms
focus_follows_mouse no

# Special window behaviour
# ------------------------------------------------------------------------------

# Use Mouse+Mod1 (Alt) to drag floating windows
floating_modifier Mod1

# NOTE use `xprop` to find details of open windows
# Generic windows
for_window [window_role="pop-up"] floating enable
for_window [window_role="bubble"] floating enable
for_window [window_role="task_dialog"] floating enable
for_window [window_role="Preferences"] floating enable
for_window [window_type="dialog"] floating enable
for_window [window_type="menu"] floating enable

# Dropdown terminal
for_window [instance="dropdown"] floating enable
for_window [instance="dropdown"] border pixel 1
for_window [instance="dropdown"] resize set 1500 800
# NOTE how to calculate the dropdown terminal's size for centering at the top:
# { (width of screen) - (width of terminal) } / 2
# E.g. 1920 - 1500 = 420; 420 / 2 = 210
for_window [instance="dropdown"] move position 210 0
for_window [instance="dropdown"] move scratchpad

# Application windows
for_window [class="Thunderbird" window_role="Msgcompose"] floating enable
for_window [class="Thunderbird" window_role="Msgcompose"] resize set 1200 800
for_window [class="Thunderbird" window_role="Msgcompose"] move position center

for_window [class="Pavucontrol"] floating enable
for_window [class="Firefox" window_role="About"] floating enable
for_window [class="Lightdm-settings"] floating enable
for_window [class="Lightdm-gtk-greeter-settings"] floating enable

# # Disabled border around Xfce whisker menu
# for_window [window_type="dialog"] border pixel 0

# # Xfce panel
# for_window [class="Xfce4-panel"] floating enable
# for_window [class="Xfce4-panel"] border pixel 0

# # App launcher window defaults
# for_window [class="Xfce4-appfinder"] floating enable
# for_window [class="Xfce4-appfinder"] resize set 1200 600
# for_window [class="Xfce4-appfinder"] move position center

# Window state decorations
# ------------------------------------------------------------------------------

# NOTE some of these do not seem relevant in i3-gaps
# order: BORDER BACKGROUND FOREGROUND INDICATOR CHILD_BORDER
client.focused $col8 $col0 $col15 $col5 $col10
client.unfocused $col0 $col8 $col7 $col7 $col0
client.focused_inactive $col0 $col0 $col0 $col0 $col0
client.urgent $col1 $col1 $col8 $col1 $col1
client.background $col8

# Window actions
# ------------------------------------------------------------------------------
# UPDATE 2018-06-23
    # Mod1 is the Alt key. Those key bindings may conflict with Emacs.

# Jump to last urgent window
bindsym $mod+x [urgent=latest] focus

# Resizing
bindsym $mod+i resize shrink width 10 px or 10 ppt
bindsym $mod+o resize grow width 10 px or 10 ppt

bindsym $mod+Shift+i resize shrink height 10 px or 10 ppt
bindsym $mod+Shift+o resize grow height 10 px or 10 ppt

# Change gap size
bindsym $mod+Mod1+o gaps inner all plus 5; exec notify-send "Dynamic gaps" "Increased all inner gaps by 5"
bindsym $mod+Mod1+i gaps inner all minus 5; exec notify-send "Dynamic gaps" "Decreased all inner gaps by 5"
bindsym $mod+Mod1+u gaps inner all set 0; exec notify-send "Dynamic gaps" "Reset all inner gaps to 0"

bindsym $mod+Mod1+Ctrl+o gaps outer all plus 5; exec notify-send "Dynamic gaps" "Increased all outer gaps by 5"
bindsym $mod+Mod1+Ctrl+i gaps outer all minus 5; exec notify-send "Dynamic gaps" "Decreased all outer gaps by 5"
bindsym $mod+Mod1+Ctrl+u gaps outer all set 0; exec notify-send "Dynamic gaps" "Reset all outer gaps to 0"

# Vertical split
bindsym $mod+s split v

# Horizontal split
bindsym $mod+Shift+s split h

# Enter fullscreen
bindsym F11 fullscreen toggle
bindsym $mod+f fullscreen toggle

# Kill focused window
bindsym $mod+q kill
bindsym Ctrl+q kill

# Change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# Move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# Toggle tiling / floating state
bindsym $mod+Shift+space floating toggle

# Change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# # Make the currently focused window a scratchpad
# bindsym $mod+Insert move scratchpad

# Show the first scratchpad window
bindsym $mod+grave scratchpad show

# Workspace actions
# ==============================================================================
bindsym $mod+Tab workspace back_and_forth

# Workspace definitions
set $ws1 1
set $ws2 2
set $ws3 3
set $ws4 4
set $ws5 5
set $ws6 6
set $ws7 7
set $ws8 8
set $ws9 9
set $ws10 10

# Switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

# Move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1; exec notify-send "Moved window to workspace 1"
bindsym $mod+Shift+2 move container to workspace $ws2; exec notify-send "Moved window to workspace 2"
bindsym $mod+Shift+3 move container to workspace $ws3; exec notify-send "Moved window to workspace 3"
bindsym $mod+Shift+4 move container to workspace $ws4; exec notify-send "Moved window to workspace 4"
bindsym $mod+Shift+5 move container to workspace $ws5; exec notify-send "Moved window to workspace 5"
bindsym $mod+Shift+6 move container to workspace $ws6; exec notify-send "Moved window to workspace 6"
bindsym $mod+Shift+7 move container to workspace $ws7; exec notify-send "Moved window to workspace 7"
bindsym $mod+Shift+8 move container to workspace $ws8; exec notify-send "Moved window to workspace 8"
bindsym $mod+Shift+9 move container to workspace $ws9; exec notify-send "Moved window to workspace 9"
bindsym $mod+Shift+0 move container to workspace $ws10; exec notify-send "Moved window to workspace 10"

# Move focused container to workspace and switch to it
bindsym Ctrl+$mod+Shift+1 move container to workspace $ws1, workspace $ws1
bindsym Ctrl+$mod+Shift+2 move container to workspace $ws2, workspace $ws2
bindsym Ctrl+$mod+Shift+3 move container to workspace $ws3, workspace $ws3
bindsym Ctrl+$mod+Shift+4 move container to workspace $ws4, workspace $ws4
bindsym Ctrl+$mod+Shift+5 move container to workspace $ws5, workspace $ws5
bindsym Ctrl+$mod+Shift+6 move container to workspace $ws6, workspace $ws6
bindsym Ctrl+$mod+Shift+7 move container to workspace $ws7, workspace $ws7
bindsym Ctrl+$mod+Shift+8 move container to workspace $ws8, workspace $ws8
bindsym Ctrl+$mod+Shift+9 move container to workspace $ws9, workspace $ws9
bindsym Ctrl+$mod+Shift+0 move container to workspace $ws10, workspace $ws10

# Dashboard
bindsym $mod+Delete workspace 0; exec $term -e ranger; exec $term -e htop; exec notify-send "Switched to dashboard"

# Session management
# ==============================================================================
# UPDATE 2018-06-23
    # I am not sure if the systemctl commands work on Debian Stretch
    # Please test.
    # Also note that the lock action depends on i3lock

# Lock, Log out, Switch users, Reboot, Shut down
bindsym Ctrl+Mod1+l exec --no-startup-id i3lock -i ~/.config/i3/lock.png
bindsym Ctrl+Mod1+o exec --no-startup-id i3-msg exit, mode "default"
bindsym Ctrl+Mod1+s exec --no-startup-id "dm-tool switch-to-greeter"
bindsym Ctrl+Mod1+r exec --no-startup-id systemctl reboot, mode "default"
bindsym Ctrl+Mod1+End exec --no-startup-id systemctl poweroff -i, mode "default"

# Applications
# ==============================================================================

# Application shortcuts
# ------------------------------------------------------------------------------

# UPDATE 2018-06-23
    # The application shortcuts are BAD key choices.
    # Mod1 (Alt) can conflict with other programs.
    # My usage at that time did not produce any errors.
    # So please adapt accordingly.
    #
    # As a side note, bspwm has this nice feature of key chord chains.
    # So you can use miltiple keys to do something (like in Emacs).
    # See sxhkd in my current dotfiles if you are curious:
    # https://gitlab.com/protesilaos/dotfiles/tree/master/bspwm/.config


# NOTE binding to Mod1 (Alt) may break functionality for apps that rely on it
# NOTE does not happen with the tools I use
# NOTE thus Mod1+<Number> is scalable (whereas $mod + first letter is tricky)
bindsym $mod+Return exec $term
bindsym $mod+Shift+Return exec --no-startup-id $scratchterm -name dropdown; exec notify-send "Dropdown terminal" "Launch with super+grave"
bindsym Mod1+1 exec $browser; exec notify-send "Internet browser" "Launching application"
bindsym Mod1+2 exec $fm; exec notify-send "File manager" "Launching application"
bindsym Mod1+3 exec $rss; exec notify-send -i /usr/share/icons/Papirus-Dark/64x64@2x/apps/RSS_feeds.svg "Feed reader" "Launching application"
bindsym Mod1+4 exec $mail; exec notify-send "Mail client" "Launching application"
bindsym Mod1+5 exec $music; exec notify-send "Music player" "Launching application"
bindsym Mod1+6 exec $podcast; exec notify-send "Podcast player" "Launching application"
bindsym Mod1+7 exec $imageeditor; exec notify-send "Image editor" "Launching application"

# UPDATE 2018-06-23
    # The way the dmenu scripts are called is not portable.
    # It would be easier to have a colour palette with colour variables,
    # source it in an executable, and then assign $scratchterm to the executable.
    #
    # For inspiration see, the way I call the *menu scripts in my current dots:
    # https://gitlab.com/protesilaos/dotfiles/tree/master/bin/bin
    #
    # I noted this above for the $scratchterm
# dmenu implementations
## Desktop
bindsym $mod+a exec --no-startup-id i3-dmenu-desktop --dmenu="dmenu -f -i -l 20 -p 'Launch App' -m 0 -fn 'DejaVu Sans Mono-12' -nb '$col0' -nf '$col15' -sb '$col2' -sf '$col0'"
## Executables
bindsym $mod+d exec --no-startup-id dmenu_run -l 20 -p 'Run Command' -m 0 -fn 'DejaVu Sans Mono-12' -nb '$col0' -nf '$col15' -sb '$col5' -sf '$col0'
## Pass
bindsym $mod+p exec --no-startup-id passmenu -f -i -l 20 -p 'Get password' -m 0 -fn 'DejaVu Sans Mono-12' -nb '$col0' -nf '$col15' -sb '$col4' -sf '$col0'

# Utilities
# ==============================================================================

# Screenshot tool
# ------------------------------------------------------------------------------
# NOTE notify-send timeout `-t` is set to 1000 miliseconds
# NOTE higher values interfere with multiple scrots in quick succession

# Focused window
bindsym Print exec scrot -u -z '%Y-%m-%d_%H:%M:%S_$wx$h$n.png' -e 'mv $f ~/Desktop'; exec notify-send "Window view screenshot" "Saved image to Desktop"

# Full screen
bindsym $mod+Print exec scrot -z '%Y-%m-%d_%H:%M:%S_$wx$h.png' -e 'mv $f ~/Desktop'; exec notify-send "Screen view screenshot" "Saved image to Desktop"

# Multimedia
# ==============================================================================

# Session recording
# ------------------------------------------------------------------------------
# UPDATE 2018-06-23
    # Those scripts are obsolete. I have a slightly better approach:
    # https://gitlab.com/protesilaos/dotfiles/blob/master/bin/bin/own_script_ffmpeg_screencast
    # Can be interfaced with a dmenu script:
    # https://gitlab.com/protesilaos/dotfiles/blob/master/bin/bin/screencastmenu
    # Please adapt accordingly.
set $record --no-startup-id "~/.local/bin/ffmpeg-x-session-capture.sh"

# NOTE Same key for both audio and video recording
set $stoprecord --no-startup-id killall ffmpeg

bindsym $mod+r exec $record; exec notify-send "Started screen recording" "Stop with Super+Shift+r"
bindsym $mod+Shift+r exec $stoprecord; exec notify-send "Terminated screen recording" "The file is on the ~/Desktop"

# Microphone volume controls
# ------------------------------------------------------------------------------
# set $micmute --no-startup-id amixer set Capture toggle
# set $micvolumeup --no-startup-id amixer set Capture 5%+
# set $micvolumedown --no-startup-id amixer set Capture 5%-

# UPDATE 2018-06-23
    # Those scripts are obsolete.
    # Just use the above three commands.
# NOTE `notify-send` actions are set in the script
set $micmute --no-startup-id "~/.local/bin/mic-volume-notify-send.sh mute"
set $micvolumeup --no-startup-id "~/.local/bin/mic-volume-notify-send.sh up"
set $micvolumedown --no-startup-id "~/.local/bin/mic-volume-notify-send.sh down"

bindsym Shift+XF86AudioMute exec $micmute
bindsym Shift+XF86AudioLowerVolume exec $micvolumedown
bindsym Shift+XF86AudioRaiseVolume exec $micvolumeup

# Speaker volume controls
# ------------------------------------------------------------------------------
set $mute --no-startup-id amixer set Master toggle
set $volumeup --no-startup-id amixer set Master 5%+
set $volumedown --no-startup-id amixer set Master 5%-

bindsym XF86AudioMute exec $mute
bindsym XF86AudioLowerVolume exec $volumedown
bindsym XF86AudioRaiseVolume exec $volumeup

# NOTE the keys are just in close proximity
# NOTE applies to media player keys on the lower row (a, s, d)
bindsym Mod1+z exec $mute
bindsym Mod1+x exec $volumedown
bindsym Mod1+c exec $volumeup

# Media player controls
# ------------------------------------------------------------------------------
set $play --no-startup-id mpc toggle
set $prev --no-startup-id mpc prev
set $next --no-startup-id mpc next
set $songnotify --no-startup-id notify-send "Now Playing" "$(mpc --format '%artist% ~ %title% \[%album%\]' current)"

bindsym $mod+XF86AudioMute exec $play
bindsym $mod+XF86AudioLowerVolume exec $prev; exec $songnotify
bindsym $mod+XF86AudioRaiseVolume exec $next; exec $songnotify

# NOTE the keys are just in close proximity
# NOTE applies to volume keys on the upper row (z, x, c)
bindsym Mod1+a exec $play
bindsym Mod1+s exec $prev; exec $songnotify
bindsym Mod1+d exec $next; exec $songnotify

# Autostart programs
# ==============================================================================

# Wallpaper
exec --no-startup-id feh --bg-fill ~/.config/i3/wallpaper.jpg

# UPDATE 2018-06-23
    # Currently I call the keyring from within ~/.profile
    # See:
    # https://gitlab.com/protesilaos/dotfiles/blob/master/shell/.profile
# NOTE moved to ~/.xprofile
# # GNOME keyring
# exec --no-startup-id "eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"

# NOTE moved to ~/.xprofile
# # Hide the mouse
# exec --no-startup-id unclutter

# Compositor for transparency and no screen tearing
exec --no-startup-id compton -b

# NOTE moved to ~/.xprofile
# # Start the Music Player Daemon
# # NOTE Do not use this together with the systemd autostart method
# exec --no-startup-id mpd

# NOTE moved them to ~/.xprofile
# # Keyboard settings
# exec --no-startup-id "setxkbmap -option compose:menu"
# exec --no-startup-id "setxkbmap -layout 'us,gr' -option 'grp:alt_shift_toggle'"

# # NOTE XXX the following is specific to my monitor's colour settings
# exec --no-startup-id "/usr/bin/xcalib -d :0 /usr/share/color/icc/colord/Gamma5500K.icc"
```
