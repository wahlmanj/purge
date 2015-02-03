cd /Applications/purge

#current user
whoami=${USER}

if [ -s Applications/purge/sudoers2 ]

then
rm /Applications/purge/sudoers2
sed -e "s/__USERNAME__/$whoami/" "/Applications/purge/sudoers" > /Applications/purge/sudoers2

else
sed -e "s/__USERNAME__/$whoami/" "/Applications/purge/sudoers" > /Applications/purge/sudoers2

fi




