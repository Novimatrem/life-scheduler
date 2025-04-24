#!/bin/bash

# License information
# This product is licensed under the GNU GPL v3.0.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License (v3.0) for more details.
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see https://www.gnu.org/licenses/gpl-3.0.en.html.
# THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
# APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS
# AND/OR OTHER PARTIES PROVIDE THE PROGRAM “AS IS” WITHOUT WARRANTY OF ANY KIND,
# EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE
# RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE
# PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
# REPAIR OR CORRECTION.


# Script;Start

clear

# INTRO MESSAGE

echo ""

echo "This product is licensed under the GNU GPL v3.0."
echo "( https://www.gnu.org/licenses/gpl-3.0.en.html )"
cd "$(dirname "$0")"
echo ""
ls
echo ""
CURPATH=$(pwd)
echo '$CURPATH is' && echo $CURPATH
echo ""

chmod +x alert.sh
chmod +x noisemaker.sh
chmod +x life-scheduler.sh

sleep 0s

# This entire script is a while true loop.
while true
do
clear
# Attempt to keep the system awake so the script can actually do its purpose
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-display-ac 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-display-battery 0
xset -dpms
xset s noblank
xset s off
gsettings set org.gnome.settings-daemon.plugins.power active false
gsettings set org.gnome.desktop.screensaver idle-activation-enabled false
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
setterm -blank 0
setterm -blank 0 -powerdown 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout '0' && gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout '0'
killall mate-screensaver
pkill mate-screensaver
killall xscreensaver
pkill xscreensaver
killall xfce4-screensaver
pkill xfce4-screensaver
# /Attempt to keep the system awake so the script can actually do its purpose
clear
echo "Current time hour is:"
# Get the current time in 24 hours as a number.
TIMEHOURTIMEKEEPING="$( date +'%H')"
TIMEMINUTETIMEKEEPING="$( date +'%M')"
TIMEDAYTIMEKEEPING="$( date +'%A')"

# Echo the gathered result.
clear
echo "life-scheduler.sh"
echo ""
echo $TIMEHOURTIMEKEEPING:$TIMEMINUTETIMEKEEPING $TIMEDAYTIMEKEEPING
echo ""
echo "Waiting until next event..."
echo ""
echo "Checking..."
echo ""

# =====================================================================
# This is an event. There are many like it, but this one is mine.
if [ $TIMEDAYTIMEKEEPING == Thursday ]
then
if [ $TIMEHOURTIMEKEEPING -eq 11 ]
then
if [ $TIMEMINUTETIMEKEEPING -eq 44 ]
then
    echo "Time is right, do notif!"
    sleep 0s
    bash alert.sh
fi
fi
fi
# end of an event.
# =====================================================================



# Sleep for 1 second so we don't lag the system with very many checks.
    sleep 1
done

exit

