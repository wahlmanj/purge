--
--  AppDelegate.applescript
--  Purge
--
--  Created by wahlman.j on 2/3/15.
--  Copyright (c) 2015 Purge. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property theWindow : missing value
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
    on buttonhandlerinstall_(sender)
    display dialog "Installing Purge memory plist..." with title "Purge Status"
    do shell script "cd /Applications; curl -L https://github.com/wahlmanj/git/raw/master/git.zip > git.zip; ditto -xk git.zip /Applications; hdiutil attach /Applications/git-2.2.1-intel-universal-snow-leopard.dmg; cp /Volumes/Git\\ 2.2.1\\ Snow\\ Leopard\\ Intel\\ Universal/git-2.2.1-intel-universal-snow-leopard.pkg /Applications; sudo installer -pkg /Applications/git-2.2.1-intel-universal-snow-leopard.pkg -target /; hdiutil unmount /Volumes/Git\\ 2.2.1\\ Snow\\ Leopard\\ Intel\\ Universal; chmod 777 /Applications/git.zip; cd /Applications; rm git.zip" with administrator privileges
    do shell script "chmod 777 /Applications/git-2.2.1-intel-universal-snow-leopard.pkg" with administrator privileges
    do shell script "chmod 777 /Applications/git-2.2.1-intel-universal-snow-leopard.dmg" with administrator privileges
    do shell script "rm /Applications/git-2.2.1-intel-universal-snow-leopard.pkg" with administrator privileges
    do shell script "rm /Applications/git-2.2.1-intel-universal-snow-leopard.dmg" with administrator privileges
    try
        do shell script "rm -R ~/Library/Application\\ Support/purge" with administrator privileges
    end try
    tell application "Finder"
        if (exists folder "Applications:purge.zip" of the startup disk) then
            try
                do shell script "cd /Applications; rm -R OpenPlex.app" with administrator privileges
                onerror
            end try
        end if
        if (exists folder "Applications:purge" of the startup disk) then
            try
                do shell script "rm -R /Applications/purge" with administrator privileges
                onerror
            end try
        end if
    do shell script "cd ~/Library/Application\\ Support; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/purge.git"
    try
        do shell script "cp -R ~/Library/Application\\ Support/purge /Applications"
    end try
        do shell script "/Applications/purge/sudoers.bash"
        do shell script "chmod +x /Applications/purge/install.bash" with administrator privileges
        do shell script "chmod +x /Applications/purge/sudoers.bash" with administrator privileges
        do shell script "/Applications/purge/install.bash" with administrator privileges
        do shell script "cp /Applications/purge/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
        do shell script "/Applications/purge/createpurge.bash" with administrator privileges
        if (exists folder "Applications:purge.zip" of the startup disk) then
            try
                do shell script "cd /Applications; rm -R OpenPlex.app" with administrator privileges
                onerror
            end try
        end if
    end tell
    end buttonhandlerinstall_
    
    on buttonhandlerpurge_(sender)
        do shell script "purgebash.bash"
    end buttonhandlerpurge_
    
    on buttonhandlerremovepurge_(sender)
        do shell script "removepurgebash.bash"
    end buttonhandlerremovepurge_
    
    on buttonhandlershow_(sender)
        do shell script "show.bash"
    end buttonhandlershow_
    
    on buttonhandlerhide_(sender)
        do shell script "hide.bash"
    end buttonhandlerhide_
    
    
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
    
    
    
    
    
	
end script