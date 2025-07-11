#!/bin/zsh
#################################################################
#### AUTHOR: toydotgame                                         #
#### CREATED ON: 2025-01-18                                     #
#### UToy: A collection of day-to-day useful Linux utilities.   #
#### Runs best at 40 columns or more.                           #
#################################################################

# DEPENDENCIES:
# - zsh
# - pacman
# Additional by module can be installed with `utoy install`

########
# INIT #
########
setopt aliases
if [ -f "$HOME/.zshrc" ]; then . ~/.zshrc; fi
SOURCE="$(realpath $0)"   # Script location
VWIDTH="$(tput cols)"
OPTIONS=("${@:2}")        # Later fetched by functions as if they were a command and these were $@
MENU_SELECTION=""
RUN_FROM_CMD="false"      # Set to "true" in load_module() if called from cmdline. Modules exit when done if run via the terminal

# ANSI Terminal Controls:
COLOR_OUT="\e[0;36m"      # Output
COLOR_WARN="\e[1;33m"     # Warnings
COLOR_ERR="\e[1;31m"      # Errors
COLOR_LOGO="\e[1;35m"     # Warnings
COLOR_SELECT="\e[30;107m" # Selected text
COLOR_BOLD="\e[1m"        # Highlights in the help command
COLOR_UNDER="\e[4m"       # Command highlights in the help command
COLOR_RESET="\e[0m"       # Reset colour/highlight text
HIDE_CURSOR="\e[?25l"
SHOW_CURSOR="\e[?25h"

# Logging:
alias echo="echo -e"
log() { echo "$COLOR_OUT$1$COLOR_RESET" }
warn() { echo "$COLOR_WARN$1$COLOR_RESET" }
err() { echo "$COLOR_ERR$1$COLOR_RESET" >&2 }
log_center() {
	PADDING=$((($VWIDTH-${#1})/2))
	for i in {1..$PADDING}; do printf " "; done
	printf "$2$1$COLOR_RESET\n"
}

# Update checking:
VERSION="a1.0.6"          # Local version is checked against the one at toydotgame.net/media/utoy.sh
LATEST="$(curl -sLm 5 https://toydotgame.net/media/utoy.sh | grep 'VERSION=' | cut -d '"' -f2 | awk 'FNR==1')"
LAST_UPDATE_YEAR="2025"
if [ "$VERSION" != "$LATEST" ]; then
	log "${COLOR_WARN}UToy is not up to date! Latest: $LATEST, local: $VERSION.\nRun ${COLOR_RESET}utoy update$COLOR_WARN to update\n"
fi
# pacman needs array format, not just space delimited packages:
DEPENDENCIES=("coreutils" "discord" "extra-cmake-modules" "ffmpeg" "firefox" "git" "iproute2" "kwin" "openssh" "plasma-desktop" "procps-ng" "sshpass" "systemd" "vim" "wmctrl" "yt-dlp")

# FEATURE LIST TODO:
# * help command listing for utoy
# * yt-dlp to mp4 or mp3, and list formats available too
# * iccmcssh access
# * iccmcscp (decode some kind of shorthand to replace with `iccmc@192.168.1.100:`)
# * shortcut to toydotgame.net/utils
# * nicer git clone with auto cd and nicer progress text/when done say what branch ur on
# * good calculator
# * compress/decompressor
# * which package provides <command>?
# * `find` interface
#     * find all with extension or find all containing filename
#     * case insensitive
#     * dump stderr to /dev/null
#     * say no files found if 0 lines output
# * search (case insensitive) and taskkill for running tasks
# * updater of local script (good luck lol)
# * zsh completions
# * update check once a day max (use $(date))
# * chmod numerical abbreviations cheat sheet, note 755 default for dirs and 644 default for files
# remember every module can be run also with `utoy <cmd> [args]`

module_restart_plasma() { # Restart plasma
	case "${OPTIONS[1]}" in;
		"soft") MENU_SELECTION="Soft restart (kill plasmashell)" ;;
		"hard") MENU_SELECTION="Hard restart (replace kwin_x11 and plasmashell)" ;;
		*) MENU_SELECTION="" ;;
	esac
	if [ -z "$MENU_SELECTION" ]; then
		log "What DE restart level would you like?"
		if [ "$RUN_FROM_CMD" = "true" ]; then
			menu "Soft restart (kill plasmashell)" "Hard restart (replace kwin_x11 and plasmashell)"
		else
			menu "Soft restart (kill plasmashell)" "Hard restart (replace kwin_x11 and plasmashell)" "Cancel"
		fi
	fi
	case "$MENU_SELECTION" in;
		"Soft restart (kill plasmashell)")
			log "Restarting Plasma..."
			killall plasmashell
			kstart plasmashell ;;
		"Hard restart (replace kwin_x11 and plasmashell)")
			log "Restarting KWin and Plasma..."
			kwin_x11 --replace >/dev/null 2>&1 & disown
			plasmashell --replace >/dev/null 2>&1 & disown ;;
		"Cancel") main ;;
	esac
	main_menu_prompt
}

module_test() { # Test Zsh syntax
	TMPFILE="/tmp/utoy-$(date +%s%N).sh"
	echo "#!/bin/zsh\n# Blank syntax test file created by UToy $VERSION\n# CREATED ON: $(date +%Y-%m-%d)\n\n\n" >> "$TMPFILE"
	vim +5 -c "startinsert" "$TMPFILE"
	chmod +x "$TMPFILE"
	log "File saved. What would you like to do?"

	while true; do
		if [ "$RUN_FROM_CMD" = "true" ]; then
			menu "Run" "Edit" "Save & exit" "Delete & exit"
		else
			menu "Run" "Edit" "Save & exit" "Delete & exit" "Delete & quit to main menu"
		fi
		case "$MENU_SELECTION" in;
			"Run")
				log "Running script..."
				printf "$COLOR_OUT"; for i in {1..$VWIDTH}; do printf "#"; done; printf "$COLOR_RESET\n"
				eval "$TMPFILE"
				printf "$COLOR_OUT"; for i in {1..$VWIDTH}; do printf "#"; done; printf "$COLOR_RESET\n"
				log "Run complete. What would you like to do?" ;;
			"Edit")
				vim +5 "$TMPFILE"
				log "File saved. What would you like to do?" ;;
			"Save & exit")
				DEST="" # Must be declared for vared to work
				log "Where would you like to save to?"; vared DEST
				if [ -z "$DEST" ]; then
					DEST="$(realpath .)"
				else
					DEST="${DEST/#\~/$HOME}" # Substitute `~` for $HOME value. From https://stackoverflow.com/a/27485157
				fi
				if grep -qi "/" <<< "$DEST" && [ ! -d "${DEST%/*}" ]; then
					if ! mkdir -p "${DEST%/*}" >/dev/null 2>&1; then
						err "Save failed! Directory does not exist and could not be created."
						log "\nWhat would you like to do?"
						continue # Break from case
					fi
				fi
				if ! mv -i "$TMPFILE" "$DEST"; then
					err "Save failed! Couldn't save file to this location."
					log "\nWhat would you like to do?"
					continue
				fi
				log "File saved."
				break ;;
			"Delete & exit")
				log "${COLOR_ERR}Are you sure? (Cannot be undone)"
				menu "Yes" "No"
				if [ $MENU_SELECTION = "Yes" ]; then
					rm -f "$TMPFILE"
					log "File deleted."
					break
				fi
				log "Deletion cancelled. What would you like to do?" ;;
			"Delete & quit to main menu")
				log "${COLOR_ERR}Are you sure? (Cannot be undone)"
				menu "Yes" "No"
				if [ $MENU_SELECTION = "Yes" ]; then
					rm -f "$TMPFILE"
					log "File deleted."
					main
					break # I don't think this is ever reached (so long as main() doesn't fail for whatever reason) so this is more a safety net
				fi
				log "Deletion cancelled. What would you like to do?" ;;
		esac
	done
}

module_post_update() { # Fix Vencord, KWin, & Yay post-update
	case "${OPTIONS[1]}" in;
		"discord") ;& "vencord") MENU_SELECTION="Vencord" ;;
		"kwin") MENU_SELECTION="KWin window decorations" ;;
		"yay") MENU_SELECTION="Yay" ;;
		"orphans") MENU_SELECTION="List orphaned packages" ;;
		"all") MENU_SELECTION="All" ;;
		*) MENU_SELECTION="" ;; # Reset menu selection because we kinda bodgily use it to parse cmdline inputs into this module
	esac
	if [ -z "$MENU_SELECTION" ]; then
		log "What would you like to patch/update?"
		if [ "$RUN_FROM_CMD" = "true" ]; then
			menu "Vencord" "KWin window decorations" "Yay" "List orphaned packages" "All"
		else
			menu "Vencord" "KWin window decorations" "Yay" "List orphaned packages" "All" "Cancel"
		fi
	fi

	if [ "$MENU_SELECTION" = "Cancel" ]; then
		main
	fi

	if [ "$MENU_SELECTION" = "Vencord" ] || [ "$MENU_SELECTION" = "All" ]; then
		# Code for extras/discord:
		#sudo rm -f /opt/discord/discord.desktop /opt/discord/discord.png
		#sudo ln -s ~/pkgs/discord.desktop /opt/discord/discord.desktop
		#sudo ln -s ~/pkgs/discord.png /opt/discord/discord.png
		
		# Code for aur/discord_arch_electron:
		#sudo rm -f /usr/share/applications/discord.desktop
		#sudo ln -s ~/pkgs/discord.desktop /usr/share/applications/discord.desktop

		# Code for aur/vesktop-bin:
		sudo rm -f /usr/share/applications/vesktop.desktop
		sudo ln -s ~/pkgs/vesktop.desktop /usr/share/applications/vesktop.desktop
		
		# Needed only for discord-based installs, not Vesktop-based ones:
		#sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
	fi

	if [ "$MENU_SELECTION" = "KWin window decorations" ] || [ "$MENU_SELECTION" = "All" ]; then
		#########################################################################
		#### AUTHOR: toydotgame                                                 #
		#### CREATED ON: 2025-01-17                                             #
		#### Formerly recompile-kwin.sh                                         #
		#### Quick script to recompile KWin Aero effects after a system upgrade #
		#########################################################################
		
		AEROTHEMEPLASMA_DIR="$HOME/pkgs/aerothemeplasma/"
		cd "$AEROTHEMEPLASMA_DIR"
		# Force git pull:
		git fetch && \
		git reset --hard HEAD && \
		git merge origin/main

		# See https://gitgud.io/wackyideas/aerothemeplasma/-/blob/master/INSTALL.md?ref_type=heads#getting-started-
		sh compile.sh

		# Re-compile KWin effects:
		#cd "kwin/decoration/"
		#chmod +x install.sh
		#./install.sh
		#cd ..
		#
		#cd "effects_cpp/"
		#for i in *; do
		#	cd "$i"
		#	chmod +x install.sh
		#	./install.sh
		#	cd ..
		#done

		RUN_FROM_CMD="true" OPTIONS=("hard") module_restart_plasma # Call `utoy restartplasma hard`
	fi

	if [ "$MENU_SELECTION" = "Yay" ] || [ "$MENU_SELECTION" = "All" ]; then
		PKGS_DIR="$HOME/pkgs/"

		if [ -d "$PKGS_DIR/yay/" ]; then
			if ! rm -rf "$PKGS_DIR/yay/" >/dev/null 2>&1; then
				err "Existing Yay folder found in $PKGS_DIR/yay/ and couldn't be removed!"
				log "Please remove it manually before trying to recompile."
				return
			fi
		fi

		cd "$PKGS_DIR"
		git clone "https://aur.archlinux.org/yay.git" "yay/" && \
		cd "yay/" && \
		makepkg -sirc --noconfirm && \
		cd .. && \
		rm -rf "yay/"
	fi

	if [ "$MENU_SELECTION" = "List orphaned packages" ] || [ "$MENU_SELECTION" = "All" ]; then
		log "Finding orphans..."
		pacman -Qdt

		log "Would you like to remove these packages?"
		menu "Yes" "No"
		if [ "$MENU_SELECTION" = "Yes" ]; then
			sudo pacman -Rsn $(pacman -Qdtq) --noconfirm
		fi
	fi

	main_menu_prompt
}

module_status() { # Computer status & version info
	print_title
	log_center "STATUS"
	log "\tUToy Version:$COLOR_RESET $VERSION (Latest: $LATEST)"
	log "\tCPU Utilisation:$COLOR_RESET $(vmstat | awk 'END{id=$(NF-3); print 100-id"%"}')"
	log "\tVRAM Use:$COLOR_RESET $(free -h | awk 'FNR==2{print $3"B / "$2"B"}')"
	DF_OUTPUT="$(df -hT .)"
	log "\tWorking FS Info:$COLOR_RESET $(echo $DF_OUTPUT | awk 'FNR==1')"
	log "\t                $COLOR_RESET $(echo $DF_OUTPUT | awk 'FNR==2')"
	echo
	log_center "INTERNET"
	RUN_FROM_CMD="true" module_ip | awk '{print "\t" $0}'
	echo
	log_center "VERSIONS"
	log "\tKernel:$COLOR_RESET $(uname -r)"
	PACMAN_OUTPUT="$(pacman -Q $DEPENDENCIES --color=always 2>&1)"
	log "\tPacman:$COLOR_RESET $(echo $PACMAN_OUTPUT | awk 'FNR==1')"
	          log "$COLOR_RESET$(echo $PACMAN_OUTPUT | awk 'FNR>=2{print "\t        " $0}')"

	main_menu_prompt
}

module_ip() { # IP info
	log "$( \
		( \
			echo 'Interface' 'IPv4' 'IPv6'; ip -br addr show \
			| grep -v '127.0.0.1/8' \
			| awk '{print "\033[0;36m" $1 ":\033[0m " $3 " " $4}' \
			; printf '\033[0;36mWAN:\033[0m ' \
			; curl -sLm 5 ident.me \
		) \
		| column -tR 1 \
	)"
	main_menu_prompt
}

module_clock() { # View date & time
	if [ "$RUN_FROM_CMD" = "false" ]; then
		log "Loading clock...\n"
	fi

	while true; do
		# Move the cursor back to the start of the line in one go to prevent flicker
		# Add 9 spaces to account for log_center counting the cursor escape chars
		# PLUS 4 more spaces each side to erase messed up rendering as a result of hitting keys during run
		log_center "             $(date +'%A, %B %d %Y %r %Z')    \e[1A\e[K"
		sleep 0.01
	done
}

module_search() { # Search Google
	SEARCH_QUERY="$OPTIONS" # Doubles as also initialising $SEARCH_QUERY for `vared`
	if [ -z "$(echo $OPTIONS)" ]; then # Wrap $OPTIONS in `echo` because it is of type array and `-z` won't work accurately
		log "Where do you want to go today?"; vared SEARCH_QUERY # Microsoft: Making it easier
	fi
	firefox "https://google.com/search?q=$SEARCH_QUERY" & disown && \
	wmctrl -a firefox
}

###################
# CORE COMPONENTS #
###################
install() {
	if ! pacman -Q $DEPENDENCIES >/dev/null 2>&1; then
		err "Missing dependencies! Installing now..."
		sudo pacman -S $DEPENDENCIES --needed --noconfirm
	fi

	if alias utoy >/dev/null 2>&1; then
		err "UToy is already installed!"
		return
	fi

	if [ -f "$HOME/.zsh-aliases" ]; then
		printf "${COLOR_OUT}Installing UToy to ~/.zsh-aliases... "
		echo "alias utoy=\"$SOURCE\"" >> "$HOME/.zsh-aliases"
		log "Done!\nYou will need to refresh your aliases with: $COLOR_RESET. ~/.zsh-aliases"
	elif [ -f "$HOME/.zshrc" ]; then
		printf "${COLOR_OUT}Installing UToy to ~/.zshrc... "
		echo "alias utoy=\"$SOURCE\"" >> "$HOME/.zshrc"
		log "Done!\nYou will need to refresh your aliases with: $COLOR_RESET. ~/.zshrc"
	else
		err "Couldn't find .zshrc or aliases file! You'll have to add the following line to your terminal rc:"
		echo "alias utoy=\"$SOURCE\"" >&2
		err "and reload with: $COLOR_RESET. ~/.zshrc"
	fi
}

menu() {
	printf "$HIDE_CURSOR"
	OPTIONS_COUNT="${#@[@]}"
	SELECTED_INDEX=1
	if [ $OPTIONS_COUNT -le 0 ]; then
		err "No arguments supplied to menu!"
		return
	fi
	print_menu() {
		echo
		for i in {1..$OPTIONS_COUNT}; do
			if [ $i = $SELECTED_INDEX ]; then
				if echo "${@[$i]}" | grep -q $'\t' ; then
					echo "\t$COLOR_OUT> $COLOR_SELECT${@[$i]/#\\\t/}$COLOR_RESET" # Move indent to before "> "
				else
					echo "$COLOR_OUT> $COLOR_SELECT${@[$i]}$COLOR_RESET"
				fi
			else
				echo "  ${@[$i]/#\\\t/\t  }" # Horrific hack to fix indented options
			fi
		done
		#printf "\e[$((${OPTIONS_COUNT}+1))A\e[K"
	}
	print_menu "$@"

	while true; do
		read -sk1 INPUT
		if [ "$INPUT" = $'\e' ]; then
			read -sk2 INPUT
			case "$INPUT" in
				"[A") # Up arrow:
					if [ $SELECTED_INDEX -gt 1 ]; then
						((SELECTED_INDEX--))
						printf "\e[$((${OPTIONS_COUNT}+1))A\e[K" # Move the cursor up $OPTIONS_COUNT rows (cursor left at bottom after print_menu())
						print_menu "$@"
					fi ;;
				"[B") # Down arrow:
					if [ $SELECTED_INDEX -lt $OPTIONS_COUNT ]; then
						((SELECTED_INDEX++))
						printf "\e[$((${OPTIONS_COUNT}+1))A\e[K"
						print_menu "$@"
					fi ;;
			esac
		elif [ "$INPUT" = $'\n' ]; then
			MENU_SELECTION="${@[$SELECTED_INDEX]}"
			echo "$SHOW_CURSOR"
			return
		fi
	done
}

main_menu_prompt() {
	# This will cause function nesting as main() will call module_*() which will then call main(), etc.
	# However, it doesn't matter too much because the iteration limit is something like 500.
	if [ "$RUN_FROM_CMD" = "true" ]; then
		exit
	fi
	log "\nWhere would you like to go?"
	menu "Exit" "Main menu"
	if [ "$MENU_SELECTION" = "Main menu" ]; then
		main
	fi
	exit
}

print_title() {
	if [ "$VWIDTH" -ge 54 ]; then
		log_center "██╗   ██╗████████╗ ██████╗ ██╗   ██╗" "$COLOR_LOGO"
		log_center "██║   ██║╚══██╔══╝██╔═══██╗╚██╗ ██╔╝" "$COLOR_LOGO"
		log_center "██║   ██║   ██║   ██║   ██║ ╚████╔╝ " "$COLOR_LOGO"
		log_center "██║   ██║   ██║   ██║   ██║  ╚██╔╝  " "$COLOR_LOGO"
		log_center "╚██████╔╝   ██║   ╚██████╔╝   ██║   " "$COLOR_LOGO"
		log_center " ╚═════╝    ╚═╝    ╚═════╝    ╚═╝   " "$COLOR_LOGO"
	else
		log_center "UTOY" "$COLOR_LOGO"
	fi
	log_center "A collection of utilities for Zsh."
	log_center "$VERSION, (ↄ) toydotgame 2025–$LAST_UPDATE_YEAR" "$COLOR_LOGO"
	echo
}

print_help() {
	(
	PADDING=$((($VWIDTH-25)/2))
	PADDING="$(for i in {1..$PADDING}; do printf ' '; done)"
	# Extra \t here and at the first line of the manual's body as the first char is removed with `cut` later
	echo "\t${COLOR_UNDER}UTOY$COLOR_RESET(1)${PADDING}UToy Manual"
	echo
	echo '\t'$COLOR_BOLD'NAME'$COLOR_RESET'
	\tutoy - a collection of day-to-day useful Linux utilities

	'$COLOR_BOLD'SYNOPSIS'$COLOR_RESET'
	\t'$COLOR_UNDER'utoy'$COLOR_RESET' <command> [args]

	\t'$COLOR_UNDER'utoy'$COLOR_RESET'

	'$COLOR_BOLD'DESCRIPTION'$COLOR_RESET'
	\tUToy is a menial-task-automation script and effective '$COLOR_BOLD'alias'$COLOR_RESET'(1) wrapper with a command-line and text interface. Its purpose is to provide quicker, easier to remember aliases and shortcuts for day-to-day Linux tasks.

	\tUToy has a text UI, but this manual is for the command-line. See '$COLOR_BOLD'USER INTERFACES'$COLOR_RESET' for details.

	'$COLOR_BOLD'OPERATIONS'$COLOR_RESET'
	\t'$COLOR_BOLD'main'$COLOR_RESET'
	\t\tOpens the main menu.

	\t'$COLOR_BOLD'install'$COLOR_RESET'
	\t\tFirst checks all dependencies are installed with '$COLOR_BOLD'pacman'$COLOR_RESET'(8), and installs them if not. Checks if '\''utoy'\'' is aliased in the current shell (through '$COLOR_UNDER'.zshrc'$COLOR_RESET'). If UToy is not found, it first tries to install an alias to '$COLOR_UNDER'.zsh-aliases'$COLOR_RESET', and failing that, to '$COLOR_UNDER'.zshrc'$COLOR_RESET'.

	\t'$COLOR_BOLD'help'$COLOR_RESET'
	\t\tOpens this manual page.

	\t'$COLOR_BOLD'restartplasma [soft|hard]'$COLOR_RESET'
	\t\tShortcuts to replace DE tasks in the event of something breaking.

	\t\t- '$COLOR_UNDER'soft'$COLOR_RESET' will kill and restart the '$COLOR_BOLD'plasmadesktop'$COLOR_RESET' process. This is useful to fix desktop backgrounds not loading after the screen is locked.

	\t\t- '$COLOR_UNDER'hard'$COLOR_RESET' will replace/launch '$COLOR_BOLD'plasmadesktop'$COLOR_RESET' and '$COLOR_BOLD'kwin_x11'$COLOR_RESET', which is a bit more intense but will fix things like broken window decorations and windows not responding to the mouse. '$COLOR_BOLD'postupdate'$COLOR_RESET' calls '\''utoy restartplasma hard'\'' after updating the KWin window decorations.

	\t'$COLOR_BOLD'test'$COLOR_RESET'
	\t\tOpens a Vim editor window to write a Zsh script. Upon saving and quitting Vim, you will be prompted if you'\''d like to run the script you just wrote. This is intended for small tests of shell syntax too complicated to write in one line, and provides access to the Vim editor for additional editing tools. After running, you can re-edit or save your script if desired.

	\t\tBy defalt, scripts are given a generic name ('$COLOR_UNDER'utoy-<date in ns>.sh'$COLOR_RESET') and saved in '$COLOR_UNDER'/tmp/'$COLOR_RESET', and '$COLOR_BOLD'chmod'$COLOR_RESET'(1) makes them executable right after Vim quits. When saving, file paths support both relative and absolute locations, and '$COLOR_UNDER'~'$COLOR_RESET' is substituted with the value of '$COLOR_UNDER'$HOME'$COLOR_RESET'. If the save location is a directory and does not end with a file name, the generic name of the script is used.

	\t'$COLOR_BOLD'postupdate [discord|kwin|yay|orphans|all]'$COLOR_RESET'
	\t\tRuns tools to rebuild patches to certain software that breaks with '$COLOR_BOLD'pacman'$COLOR_RESET'(8) updates over time.

	\t\t- '$COLOR_UNDER'discord'$COLOR_RESET' replaces the official Discord icon PNG and application entry with custom ones in '$COLOR_UNDER'~/pkgs/'$COLOR_RESET' and runs the Vencord installer from the Web. It is useful to run this after noticing the '$COLOR_BOLD'discord'$COLOR_RESET' package has updated.

	\t\t- '$COLOR_UNDER'kwin'$COLOR_RESET' goes into '$COLOR_UNDER'$AEROTHEMEPLASMA_DIR'$COLOR_RESET' (hardcoded in this script) and recompiles the KWin decorations before installing them. When some DE libraries or '$COLOR_BOLD'plasma'$COLOR_RESET'* updates, it is useful to run this.

	\t\t- '$COLOR_UNDER'yay'$COLOR_RESET' recompiles '$COLOR_BOLD'yay'$COLOR_RESET'(8) from the AUR. Yay tends to break after most system updates because it has fragile dependencies on libraries.

	\t\t- '$COLOR_UNDER'orphans'$COLOR_RESET' will list redundant packages which are marked as dependencies but have no dependent packages present on the system. The option is given to uninstall these packages.

	\t\t- '$COLOR_UNDER'all'$COLOR_RESET' runs all of the above.

	\t'$COLOR_BOLD'status'$COLOR_RESET'
	\t\tPrints out information about resource usage, UToy/kernel/dependency versions, working filesystem, and '\''utoy ip'\'' output.

	\t'$COLOR_BOLD'ip'$COLOR_RESET'
	\t\tPrints IPs for LAN (v4/v6) interfaces, and WAN IP (v4).

	\t'$COLOR_BOLD'clock'$COLOR_RESET'
	\t\tPrints a live view of the system time using '$COLOR_BOLD'date'$COLOR_RESET'(1). Refreshes every 10 ms until ^C is hit.

	\t'$COLOR_BOLD'search [query]'$COLOR_RESET'
	\t\tSearches Google for the specified query.

	\tIf no operation is specified, '\''utoy main'\'' is implied.

	\tIf no arguments are specified to the operation, a text UI will be opened as if you had selected the operation through the main menu.

	'$COLOR_BOLD'USER INTERFACES'$COLOR_RESET'
	\tAll text UI operations have command-line interfaces, but not all command-line operations have text UIs.

	\t'$COLOR_BOLD'install'$COLOR_RESET' and '$COLOR_BOLD'help'$COLOR_RESET' do not have text interfaces. They can only be accessed from the command-line.

	'$COLOR_BOLD'SEE ALSO'$COLOR_RESET'
	\t'$COLOR_BOLD'pacman'$COLOR_RESET'(8), '$COLOR_BOLD'vim'$COLOR_RESET'(1), '$COLOR_BOLD'yay'$COLOR_RESET'(8), '$COLOR_BOLD'zsh'$COLOR_RESET'(1)

	'$COLOR_BOLD'AUTHORS'$COLOR_RESET'
	\ttoydotgame <toydotgame.net>
	') | cut -c 2- | fmt | less -cR # `cut` is needed due to the single quote's content being indented
}

main() {
	print_title
	log_center "MAIN MENU"
	log "Please choose from an option below:"
	menu \
		"Test Zsh syntax" \
		"Fix Vencord, KWin, & Yay post-update" \
			"\tRestart plasma" \
		"Computer status & version info" \
			"\tIP info" \
		"View date & time" \
		"Search Google" \
		"Exit"
	load_module "$MENU_SELECTION"
}

load_module() { # Main menu function that takes either cmdline shortcut or menu() output
	case "$1" in
		"") ;& "main") main ;;
		"install") install ;;
		"help") print_help ;;
		"restartplasma") RUN_FROM_CMD="true" ;& "\tRestart plasma") module_restart_plasma ;;
		"test") RUN_FROM_CMD="true" ;& "Test Zsh syntax") module_test ;;
		"postupdate") RUN_FROM_CMD="true" ;& "Fix Vencord, KWin, & Yay post-update") module_post_update ;;
		"status") RUN_FROM_CMD="true" ;& "Computer status & version info") module_status ;;
		"ip") RUN_FROM_CMD="true" ;& "\tIP info") module_ip ;;
		"clock") RUN_FROM_CMD="true" ;& "View date & time"); module_clock ;;
		"search") RUN_FROM_CMD="true" ;& "Search Google") module_search ;;
		"Exit") exit ;;
		*) err "Command \"$1\" not found! Run ${COLOR_RESET}utoy help$COLOR_ERR for help." ;;
	esac
}

load_module "$1"
