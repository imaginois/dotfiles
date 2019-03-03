#!/usr/bin/env bash

# https://raw.githubusercontent.com/nicknisi/dotfiles/master/install/osx.sh
# https://raw.githubusercontent.com/mathiasbynens/dotfiles/master/.macos
# https://www.intego.com/mac-security-blog/unlock-the-macos-docks-hidden-secrets-in-terminal/



echo -e "\n\n\n"
echo "========================================================================="
echo "Setting MacOS defaults."
echo "========================================================================="


defaults read NSGlobalDomain > DefaultsGlobalBefore.info

osascript -e 'tell application "System Preferences" to quit'


# ~/.macos — https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change

echo -e "\\n\\nSetting OS X settings"
echo "=============================="

echo "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "show hidden files by default"
defaults write com.apple.Finder AppleShowAllFiles -bool false

echo "expand save dialog by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "show the ~/Library folder in Finder"
chflags nohidden ~/Library

echo "disable resume system wide"
defaults write NSGlobalDomainNSQuitAlwaysKeepWindows -bool false

echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Enable subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo "Add macOS Dock spacers"
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock

echo "Disable natural scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "Create macOS Dock recent items stacks"
defaults write com.apple.dock persistent-others -array-add '{"tile-data" = {"list-type" = 1;}; "tile-type" = "recents-tile";}'; killall Dock

echo "Have the Dock show only active apps"
defaults write com.apple.dock static-only -bool false; killall Dock

echo "Show only one app at a time"
defaults write com.apple.dock single-app -bool false; killall Dock

echo "Highlight hidden apps in the Dock"
defaults write com.apple.Dock showhidden -bool yes; killall Dock

echo "highlights the item under the cursor, mirroring the selection highlight seen in stacks"
defaults write com.apple.dock mouse-over-hilite-stack -bool yes; killall Dock

echo "disable App Nap for all apps"
defaults write -g NSAppSleepDisabled -bool true;

echo "disable automatic app termination when inactive"
defaults write -g NSDisableAutomaticTermination -bool true

echo "File save, save to disk by default rather than to iCloud"
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

#echo "Set dock icon size"
#defaults write -g com.apple.dock largesize -float 60

echo "Change Apple OS X Dock size"
defaults write -g com.apple.dock tilesize -int 32; killall Dock

echo "Interface, action on double-clicking window"
defaults write -g AppleActionOnDoubleClick -string "Maximize";

echo "Always show scrollbars"
defaults write -g AppleShowScrollBars -string "WhenScrolling" # or "Automatic" or "Always"

echo "Close always confirms changes"
defaults write -g NSCloseAlwaysConfirmsChanges -bool true

echo "Disable opening and closing window animations"
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

echo "Set sidebar icon size to medium"
defaults write -g NSTableViewDefaultSizeMode -int 2


# echo "Enable the 2D Dock"
# defaults write com.apple.dock no-glass -bool true

# Automatically hide and show the Dock
# defaults write com.apple.dock autohide -bool true

#echo "Enable iTunes track notifications in the Dock"
#defaults write com.apple.dock itunes-notifications -bool true

# Disable menu bar transparency
#defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

echo  "Show remaining battery time; hide percentage"
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

#echo "Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons"
#defaults write com.apple.finder QuitMenuItem -bool true

# Disable window animations and Get Info animations in Finder
# defaults write com.apple.finder DisableAllAnimations -bool true

echo "Use current directory as default search scope in Finder"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo "Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

# echo "Expand print panel by default"
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

echo "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

#echo "Disable shadow in screenshots"
#defaults write com.apple.screencapture disable-shadow -bool true

# echo "Enable spring loading for all Dock items"
# defaults write enable-spring-load-actions-on-all-items -bool true

echo "Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

# Don’t animate opening applications from the Dock
# defaults write com.apple.dock launchanim -bool false

#echo "Display ASCII control characters using caret notation in standard text views"
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
#defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

echo "Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2

echo "Set a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 15

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable opening and closing window animations
# defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# echo "Disable disk image verification"
# defaults write com.apple.frameworks.diskimages skip-verify -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

echo "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

echo "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Increase window resize speed for Cocoa applications
# defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Show item info below desktop icons"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

echo "Enable snap-to-grid for desktop icons"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# echo "Disable the warning before emptying the Trash"
# defaults write com.apple.finder WarnOnEmptyTrash -bool false

Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

#echo "Require password immediately after sleep or screen saver begins"
#defaults write com.apple.screensaver askForPassword -int 1
#defaults write com.apple.screensaver askForPasswordDelay -int 0

# echo "Enable tap to click (Trackpad)"
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

#echo "Map bottom right Trackpad corner to right-click"
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# echo "Disable Safari’s thumbnail cache for History and Top Sites"
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo "Enable Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# echo "Make Safari’s search banners default to Contains instead of Starts With"
# defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
# defaults write com.apple.Safari ProxiesInBookmarksBar "()"

echo "Add a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

echo "Only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

echo "Disable the Ping sidebar in iTunes"
defaults write com.apple.iTunes disablePingSidebar -bool true

echo "Disable all the other Ping stuff in iTunes"
defaults write com.apple.iTunes disablePing -bool true

echo "Make ⌘ + F focus the search input in iTunes"
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"

# Disable send and reply animations in Mail.app
# defaults write com.apple.Mail DisableReplyAnimations -bool true
# defaults write com.apple.Mail DisableSendAnimations -bool true

# Disable Resume system-wide
# defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# echo "Disable the “reopen windows when logging back in” option"
# This works, although the checkbox will still appear to be checked.
# defaults write com.apple.loginwindow TALLogoutSavesState -bool false
# defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

echo "Enable Dashboard dev mode (allows keeping widgets on the desktop)"
defaults write com.apple.dashboard devmode -bool true

echo "Miniaturise on double-click"
defaults write AppleMiniaturizeOnDoubleClick -bool true


# Interface, table view default size NSTableViewDefaultSizeMode -int 2
# Keyboard, disable press-and-hold for keys in favor of key repeat ApplePressAndHoldEnabled -bool false
# Keyboard, set a shorter delay until key repeat InitialKeyRepeat -int 12 normal 68
# Keyboard, set a very fast keyboard repeat rate KeyRepeat -int 1 normal 6
# Localisation, set locale AppleLocale -string "en_GB@currency=EUR", or "en_GB", or "en_US" etc.
# Localisation, set measurement units AppleMeasurementUnits -string "Centimeters" or "Inches"
# Localisation, set metric units AppleMetricUnits -bool true
# Localisation, set temperature units AppleTemperatureUnit -string "Celsius"
# Print, expand print panel by default PMPrintingExpandedStateForPrint -bool true and PMPrintingExpandedStateForPrint2 -bool true
# Sound, disable flash with system beep com.apple.sound.beep.flash -bool false
# Sound, set system beep sound com.apple.sound.beep.sound -string "/System/Library/Sounds/Sosumi.aiff"
# Text, disable web automatic spelling correction WebAutomaticSpellingCorrectionEnabled -bool false
# Text, display ASCII control characters using caret notation in standard text views NSTextShowsControlCharacters -bool true
# Text, spell checker automatically identifies languages NSSpellCheckerAutomaticallyIdentifiesLanguages -bool true
# Trackpad, enable Force Click com.apple.trackpad.forceClick -bool true
# Trackpad, scaling factor com.apple.trackpad.scaling -float 1.5
# Web views, add a contextual menu item for showing the Web Inspector WebKitDeveloperExtras -bool true


# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Notification Center
defaults write com.apple.dock wvous-tr-corner -int 12
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Show Desktop
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom right screen corner → Launchpad
defaults write com.apple.dock wvous-br-corner -int 11
defaults write com.apple.dock wvous-br-modifier -int 0

echo "Show language menu in the top right corner of the boot screen"
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true



echo "Set standby delay to 24 hours (default is 1 hour)"
sudo pmset -a standbydelay 86400


# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable the crash reporter
#defaults write com.apple.CrashReporter DialogType -string "none"


# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
# sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Restart automatically if the computer freezes
# sudo systemsetup -setrestartfreeze on

# Never go into computer sleep mode
# sudo systemsetup -setcomputersleep Off > /dev/null

# Disable Notification Center and remove the menu bar icon
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# Set Help Viewer windows to non-floating mode
# defaults write com.apple.helpviewer DevMode -bool true


#echo "Reset Launchpad"
#[ -e ~/Library/Application\ Support/Dock/*.db ] && rm ~/Library/Application\ Support/Dock/*.db

# echo "Disable local Time Machine backups"
# hash tmutil &> /dev/null && sudo tmutil disablelocal

#echo "Remove Dropbox’s green checkmark icons in Finder"
#file=/Applications/Dropbox.app/Contents/Resources/check.icns
#[ -e "$file" ] && mv -f "$file" "$file.bak"
#unset file

#Fix for the ancient UTF-8 bug in QuickLook (http://mths.be/bbo)
# Commented out, as this is known to cause problems when saving files in Adobe Illustrator CS5 :(
#echo "0x08000100:0" > ~/.CFUserTextEncoding


###############################################################################
# SSD-specific tweaks                                                         #
###############################################################################


# Disable hibernation (speeds up entering sleep mode)
# sudo pmset -a hibernatemode 0

# Remove the sleep image file to save disk space
# sudo rm /private/var/vm/sleepimage
# Create a zero-byte file instead…
# sudo touch /private/var/vm/sleepimage
# …and make sure it can’t be rewritten
# sudo chflags uchg /private/var/vm/sleepimage


###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
# defaults write com.apple.screensaver askForPassword -int 1
# defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true






defaults read NSGlobalDomain > DefaultsGlobalAfter.info

echo "Kill affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
