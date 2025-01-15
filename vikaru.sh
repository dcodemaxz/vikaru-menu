#!/data/data/com.termux/files/usr/bin/bash

# Don't remove the watermark, respect the creator!
# -  Script by    : dcodemaxz 
# -  Github      : https://github.com/dcodemaxz/Vikaru-Bot
# -  Sosmed    : https://linktr.ee/dcodemaxz

# Lib ( Don't change it )
source lib/app.sh

# Open header ( Don't change it )
Namespace: [Std::Main STD::Log]

# Importing libraries ( Don't change it )
import.source [io:color.app, inquirer:list.app]

# Color definitions
white="\033[00m"
red="\033[31m"
yellow="\033[33m"
green="\033[32m"
blue="\033[34m"

# Symbol definitions
success="[\033[32m✓\033[0m]"
warning="[\033[33m!\033[0m]"
question="[\033[33m?\033[0m]"
denied="[\033[31mx\033[0m]"
process="[\033[34m~\033[0m]"

# Confirm resource check 
enter() {
    clear
    echo
    echo -e "  # ${warning} Checking system file. make sure your internet is Good!"
    read -r -s -p $'  • Press enter to continue...\n'
    
# Install required resources
    echo
    echo -e "  # ${process} Detect resource..."
    echo -e $white "=----------------------------------="
    sleep 1
    check_resource "pv"
    check_resource "git"
    check_resource "ruby"
    check_resource "unzip"
    check_resource "figlet"
    check_resource "toilet"
    check_resource "python"
    check_resource "ffmpeg"
    check_resource "libwebp"
    check_resource "ossp-uuid"
    check_resource "nodejs-lts"
    sleep 1
    echo
    echo -e "  # ${process} Detect directory..."
    echo -e $white "=----------------------------------="
    sleep 1
    cd /storage/emulated/0/
    if [ -d ".vikaru-bot" ]; then
    echo -e "  • ${success} Directory created!"
    sleep 2
    echo
    clear
    mainmenu
    else
    mkdir /storage/emulated/0/.vikaru-bot
    echo -e "  • ${success} mkdir /storage/emulated/0/.vikaru-bot"|pv -qL 30
    sleep 1
    mv vikaru.sh /storage/emulated/0/.vikaru-bot
    mv .git /storage/emulated/0/.vikaru-bot
    mv lib /storage/emulated/0/.vikaru-bot
    echo "echo 'Start : cd /storage/emulated/0/.vikaru-bot && bash vikaru.sh'" > "vikaru.sh"
    sleep 1
    echo -e "  • ${success} mv vikaru.sh"|pv -qL 30
    cd ~
    mkdir -p /data/data/com.termux/files/home/.termux/tasker
    chmod 700 -R /data/data/com.termux/files/home/.termux
    cd .termux
    cd tasker
    echo '#!/data/data/com.termux/files/usr/bin/bash

DIR="/storage/emulated/0/.vikaru-bot/base-vikaru-md"

# Cek apakah proses npm start sudah berjalan
if pgrep -f "npm start" > /dev/null; then
  exit 1
fi

# Jalankan npm start di direktori yang ditentukan
cd ~ && cd "$DIR" && npm start' > "start.sh"
    chmod +x "start.sh"    
    echo -e "  • ${success} mkdir .termux/tasker/start.sh"|pv -qL 30
    echo -e $white "=----------------------------------="
    sleep 2
    echo -e "  # ${warning} Start this cmd :"
    echo -e $white " "
    echo -e $white " cd /storage/emulated/0/.vikaru-bot && bash vikaru.sh"|pv -qL 30
    exit
    fi
}

# Function to check resource installation
check_resource() {
  package_name="$1"
  dpkg -s $package_name &> /dev/null
  if [ $? -eq 0 ]; then
    echo -e "  • ${success} $package_name"
    else
    echo -e "  • ${process} $package_name..."
    echo
    pkg install "$package_name" -y
    echo
    echo -e "  • ${success} $package_name installed"
    echo
  fi
}

# Vikaru-Menu
mainmenu() {
    echo -e -n $blue;figlet "VIKARU"
    echo -e $white "=----------------------------------="
    echo -e "  # ${question} Control button ${yellow}↑↓ ${white}- ${green}enter"
    echo -e $white "=----------------------------------="
main() {
  init() {
    shopt -s expand_aliases
    # menu = set as var
    Prompt="[>]"
  }

  main.setup() {
    list.input [${Prompt}, menu, output]
    # parse output
    let choice=$(grep -Eo "[0-9]" <<< "$output")
    # cat <<< "$choice";
  }
  init
}

menu=("• [1] Install" "• [2] Update" "• [3] About" "• [0] Exit")

eval main

main.setup

# Handling user selection
case "$choice" in
  1)
    clear
    maininstall
    ;;
  2)
    clear
    mainupdate
    ;;
  3)
    clear
    echo -e -n $blue;figlet "  ABOUT"
    echo -e $white "=----------------------------------="
    echo -e "  # ${warning} This script is made to make it easier for users to install bots."
    read -r -s -p $'  • [?] Press enter to back...\n'
    clear
    mainmenu
    ;;
  0)
    clear
    echo -e "  # ${success} Exit"
    exit 0
    ;;
  *)
    sleep 1
    clear    
    echo -e "  # ${denied} Input denied"|pv -qL 30
    sleep 1
    mainmenu
    ;;
esac
}

# Vikaru-Install
maininstall() {
    echo -e -n $blue;figlet "  INSTALL"
    echo -e $white "=----------------------------------="
    echo -e "  # ${question} Control button ${yellow}↑↓ ${white}- ${green}enter"
    echo -e $white "=----------------------------------="
main() {
  init() {
    shopt -s expand_aliases
    # menu = set as var
    Prompt="[>]"
  }

  main.setup() {
    list.input [${Prompt}, menu, output]
    # parse output
    let choice=$(grep -Eo "[0-9]" <<< "$output")
    # cat <<< "$choice";
  }
  init
}

menu=("• [1] Ar-Vikaru-Bot" "• [2] Base-Vikaru-Md" "• [0] Back")

eval main

main.setup

# Handling user selection
case "$choice" in
  1)
    clear
    cd /storage/emulated/0/.vikaru-bot
    echo -e -n $blue;figlet "  Vikaru-Bot"
    echo -e $white "=----------------------------------="
    echo -e "  Author : Maxtream_09"
    echo -e "  GitHub : Maxz-09"
    sleep 1
    echo
    if [ -f "ar-vikaru-bot" ]; then
    echo -e "  # ${success} This script already exists"|pv -qL 30
    sleep 1
    else
    echo -e "  • ${process} Install Ar-Vikaru-Bot..."|pv -qL 30
    sleep 1
    echo -e $white
    git clone https://github.com/Maxz-09/ar-vikaru-bot
    echo 
    echo -e "  # ${success} Succssesfully"|pv -qL 30
    sleep 2
    fi
    clear
    maininstall
    ;;
  2)
    clear
    cd /storage/emulated/0/.vikaru-bot
    echo -e -n $blue;figlet "  Vikaru-Md"
    echo -e $white "=----------------------------------="
    echo -e "  Author : Maxtream_09"
    echo -e "  GitHub : Maxz-09"
    sleep 1
    echo
    if [ -f "base-vikaru-md" ]; then
    echo -e "  # ${success} This script already exists"|pv -qL 30
    sleep 1
    else
    echo -e "  • ${process} Bot..."|pv -qL 30
    echo -e $white " " 
    git clone https://github.com/Maxz-09/base-vikaru-md
    sleep 1
    echo
    cd /storage/emulated/0/.vikaru-bot/base-vikaru-md
    echo -e "  • ${process} Unzip node_modules..."|pv -qL 30
    sleep 2
    echo -e $white " "
    unzip "node_modules.zip"
    sleep 1
    echo
    echo -e "  # ${success} Succssesfully"|pv -qL 30
    sleep 2
    fi
    clear
    maininstall
    ;;
  0)
    clear
    mainmenu
    ;;
  *)
    sleep 1
    clear    
    echo -e "  # ${denied} Input denied"|pv -qL 30
    sleep 1
    maininstall
    ;;
esac
}

# Vikaru-Update
mainupdate() {
    echo -e -n $blue;figlet "  UPDATE"
    echo -e $white "=----------------------------------="
    echo -e "  # ${question} Control button ${yellow}↑↓ ${white}- ${green}enter"
    echo -e $white "=----------------------------------="
main() {
  init() {
    shopt -s expand_aliases
    # menu = set as var
    Prompt="[>]"
  }

  main.setup() {
    list.input [${Prompt}, menu, output]
    # parse output
    let choice=$(grep -Eo "[0-9]" <<< "$output")
    # cat <<< "$choice";
  }
  init
}

menu=("• [1] Vikaru.sh" "• [2] Ar-Vikaru-Bot" "• [3] Base-Vikaru-Md" "• [0] Back")

eval main

main.setup

# Handling user selection
case "$choice" in
  1)
    cd /storage/emulated/0/.vikaru-bot/
    if [ -f "vikaru.sh" ]; then
    echo
    else
    sleep 2
    clear
    echo -e "  # ${denied} This file may have been deleted/replaced."
    echo -e $white " "
    sleep 1
    mainupdate
    fi
    echo -e $yellow "# [/] Update..."|pv -qL 30
    echo -e $white "=----------------------------------="
    echo -e $green "• [/] Vikaru.sh :"
    echo -e $white
    if [ -d ".git" ]; then
    git config --global --add safe.directory /storage/emulated/0/.vikaru-bot/
    git pull
    echo -e $white "=----------------------------------="
    sleep 1
    echo -e "  # ${success}  Succssesfully"|pv -qL 30
    sleep 2
    clear
    mainupdate
    else
    sleep 2
    clear
    echo -e "  # ${denied} The '.git' file has been deleted!"
    sleep 1
    echo
    mainupdate
    fi
    ;;
  2)
    cd /storage/emulated/0/.vikaru-bot/
    if [ -d "base-vikaru-md_demo" ]; then
    cd /storage/emulated/0/.vikaru-bot/ar-vikaru-bot/
    else
    sleep 2
    clear
    echo -e "  # ${denied} This file may have been deleted/replaced."
    echo -e $white " "
    sleep 1
    mainupdate
    fi
    echo -e $yellow "# [/] Update..."|pv -qL 30
    echo -e $white "=----------------------------------="
    echo -e $green "• [/] Ar-Vikaru-Bot :"
    echo -e $white
    if [ -d ".git" ]; then
    git config --global --add safe.directory /storage/emulated/0/.vikaru-bot/ar-vikaru-bot/
    git pull
    echo -e $white "=----------------------------------="
    sleep 1
    echo -e "  # ${success}  Succssesfully"|pv -qL 30
    sleep 2
    clear
    mainupdate
    else
    sleep 2
    clear
    echo -e "  # ${denied} The '.git' file has been deleted!"
    sleep 1
    echo
    mainupdate
    fi
    ;;
  3)
    cd /storage/emulated/0/.vikaru-bot/
    if [ -d "base-vikaru-md" ]; then
    cd /storage/emulated/0/.vikaru-bot/base-vikaru-md
    else
    sleep 2
    clear
    echo -e "  # ${denied} This file may have been deleted/replaced."
    echo -e $white " "
    sleep 1
    mainupdate
    fi
    echo -e $yellow "# [/] Update..."|pv -qL 30
    echo -e $white "=----------------------------------="
    echo -e $green "• [/] Base-Vikaru-Md :"
    echo -e $white
    if [ -d ".git" ]; then
    git config --global --add safe.directory /storage/emulated/0/.vikaru-bot/base-vikaru-md/
    git pull
    echo -e $white "=----------------------------------="
    sleep 1
    echo -e "  # ${success}  Succssesfully"|pv -qL 30
    sleep 2
    clear
    mainupdate
    else
    sleep 2
    clear
    echo -e "  # ${denied} The '.git' file has been deleted!"
    sleep 1
    echo
    mainupdate
    fi
    ;;
  0)
    clear
    mainmenu
    ;;
  *)
    sleep 1
    clear    
    echo -e "  # ${denied} Input denied"|pv -qL 30
    sleep 1
    mainupdate
    ;;
esac
}

# Start
enter
