#!/bin/bash

# navigate to path
cd /Applications/purge

# copy files to /usr/bin for system wide access
cp createpurge.bash /usr/bin
cp createpurgebash.bash /usr/bin
cp hide /usr/bin
cp hide.bash /usr/bin
cp purge.bash /usr/bin
cp purgebash.bash /usr/bin
cp removepurge.bash /usr/bin
cp removepurgebash.bash /usr/bin
cp show /usr/bin
cp show.bash /usr/bin

# fix permissions
chmod +x /usr/bin/createpurge.bash
chmod +x /usr/bin/createpurgebash.bash
chmod +x /usr/bin/hide
chmod +x /usr/bin/hide.bash
chmod +x /usr/bin/purge.bash
chmod +x /usr/bin/purgebash.bash
chmod +x /usr/bin/removepurge.bash
chmod +x /usr/bin/removepurgebash.bash
chmod +x /usr/bin/show
chmod +x /usr/bin/show.bash