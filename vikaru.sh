#!/data/data/com.termux/files/usr/bin/bash

# ------------------------------------------------------------------------------
# Don't remove the watermark, respect the creator!
# -  Script by    : dcodemaxz
# -  Github      : https://github.com/dcodemaxz/Vikaru-Bot
# -  Sosmed    : https://linktr.ee/dcodemaxz
# ------------------------------------------------------------------------------

# Lib ( Don't change it )
source .lib/app.sh

# Open header ( Don't change it )
Namespace: [Std::Main STD::Log]

# Importing libraries ( Don't change it )
import.source [io:color.app, inquirer:list.app]

# Color definitions
white="\033[00m"
green="\033[32m"
yellow="\033[33m"
red="\033[31m"
blue="\033[34m"

# Symbol definitions
success="[\033[32m✓\033[0m]"
error="[\033[33m!\033[0m]"
question="[\033[33m?\033[0m]"
denied="[\033[31mx\033[0m]"
process="[\033[34m~\033[0m]"
warning="[\033[33m⚠\033[0m]"
line="=───────────────────────────────="

# Confirm resource check
enter() {
    clear
    echo
    echo -e " \e[37m╭───────────────────────────────────────────────╮\e[0m"
    echo -e " \e[37m│\e[0m   \e[38;5;141mAuthor\e[0m : \e[37mdcodemaxz\e[0m                          \e[37m│\e[0m"
    echo -e " \e[37m│\e[0m   \e[38;5;141mSosmed\e[0m : \e[37mhttps://linktr.ee/dcodemaxz\e[0m        \e[37m│\e[0m"
    echo -e " \e[37m╰───────────────────────────────────────────────╯\e[0m"
    echo -e "\e[37m───────────────────────────────────────────────────\e[0m"
    echo -e "  # ${error} Make sure your internet is not interrupted"
    read -r -s -p $'  • [\033[33m?\033[0m] Press \033[32menter\033[0m to continue...\n'

    # Install required resources
    echo
    echo -e "  # ${process} Detect resource..."
    echo -e $white "${line}"
    sleep 1
    check_resource "pv"
    check_resource "git"
    check_resource "ruby"
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
    echo -e $white "${line}"
    sleep 1
    cd /sdcard/
    if [ -d "Vikaru-Bot" ]; then
        echo -e "  • ${success} Directory detected!"
        sleep 1
        echo
        clear
        mainmenu
    else
        cd $(dirname $0)
        mv -i Vikaru-Bot /sdcard/
        sleep 1
        echo -e "  • ${success} mv Vikaru-Bot"|pv -qL 30
        cd ~
        mkdir -p /data/data/com.termux/files/home/.termux/tasker
        chmod 700 -R /data/data/com.termux/files/home/.termux
        cd .termux
        cd tasker
        echo '#!/data/data/com.termux/files/usr/bin/bash

DIR="/sdcard/Vikaru-Bot/vikaru-md"

# Cek apakah proses npm start sudah berjalan
if pgrep -f "npm start" > /dev/null; then
  exit 1
fi

# Jalankan npm start di direktori yang ditentukan
cd ~ && cd "$DIR" && npm start' > "start.sh"
        chmod +x "start.sh"
        echo -e "  • ${success} File location successfully adjusted"|pv -qL 30
        echo -e $white "${line}"
        sleep 2
        echo -e "  # ${error} Start this cmd :"
        echo -e $white " "
        echo -e $white " cd /sdcard/Vikaru-Bot && bash vikaru.sh"|pv -qL 30
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
    echo -e $white "${line}"
    echo -e "  # ${question} Control button ${yellow}↑↓ ${white}- ${green}enter"
    echo -e $white "${line}"
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

    menu=("• [1] Start" "• [2] Install" "• [3] Update" "• [0] Exit")

    eval main
    main.setup

    # Handling user selection
    case "$choice" in
        1)
            clear
            mainstart
            ;;
        2)
            clear
            maininstall
            ;;
        3)
            clear
            mainupdate
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

# Vikaru-start
mainstart() {
    cd /sdcard/Vikaru-Bot/
    if [ -d "vikaru-md" ]; then
        # DIR=$(dirname "$(readlink -f "$0")")
        DIR="/sdcard/Vikaru-Bot/vikaru-md"

        check_status() {
            if [[ -f "$DIR/index.js" ]]; then
                local pid=$(pgrep -f "$DIR/index.js")
                if [[ -n "$pid" ]]; then
                    local status=$(ps -o stat= -p "$pid")
                    if [[ "$status" == "T" ]]; then
                        echo "suspended"
                    elif [[ "$status" == "W" ]]; then
                        echo "paging"
                    else
                        echo "running"
                    fi
                else
                    echo "stopped"
                fi
            else
                echo "missing"
            fi
        }

        while true; do
            current_status=$(check_status)
            echo -e "$WHITE"

            case "$current_status" in
                "running") # Task in progress
                    echo -e "  # ${success} Vikaru-Md is ${green}running${white}."
                    exit 0
                    ;;
                "suspended") # Task cancelled
                    echo -e "  # ${process} Vikaru-Md is ${yellow}suspended${white}, restarting..."
                    cd "$DIR" && npm start
                    ;;
                "stopped") # Task stopped
                    echo -e "  # ${process} Vikaru-Md is ${yellow}not running${white}, starting..."
                    cd "$DIR" && npm start
                    ;;
                "missing") # File not found
                    echo -e "  # ${error} index.js ${red}not found${white} in directory: ${DIR}."
                    exit 1
                    ;;
                "paging") # Potential memory issue
                    echo -e "  # ${error} Vikaru-Md might be experiencing ${yellow}memory issues (paging)${white}."
                    echo -e "  # ${process} Attempting to restart..."
                    cd "$DIR" && npm start
                    ;;
            esac
            sleep 2
        done
    else
        echo -e "  # ${denied} vikaru-md not found!"
        sleep 1
        mainmenu
    fi
}

# Vikaru-Install
maininstall() {
    echo -e -n $blue;figlet "  INSTALL"
    echo -e $white "${line}"
    echo -e "  # ${question} Control button ${yellow}↑↓ ${white}- ${green}enter"
    echo -e $white "${line}"
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

    menu=("• [1] vikaru-ar" "• [2] vikaru-md" "• [0] Back")

    eval main
    main.setup

    # Handling user selection
    case "$choice" in
        1)
            clear
            cd /sdcard/Vikaru-Bot
            echo -e -n $blue;figlet "  Vikaru-Bot"
            echo -e $white "${line}"
            echo -e "  Author : Maxz"
            echo -e "  GitHub : dcodemaxz"
            sleep 1
            echo
            if [ -f "vikaru-ar" ]; then
                echo -e "  # ${success} This script already exists"|pv -qL 30
                sleep 1
            else
                echo -e "  • ${process} Install vikaru-ar..."|pv -qL 30
                sleep 1
                echo -e $white
                git clone https://github.com/dcodemaxz/vikaru-ar
                echo
                echo -e "  # ${success} Succssesfully"|pv -qL 30
                sleep 2
            fi
            clear
            maininstall
            ;;
        2)
            clear
            cd /sdcard/Vikaru-Bot
            echo -e -n $blue;figlet "  Vikaru-Md"
            echo -e $white "${line}"
            echo -e "  Author : Maxz"
            echo -e "  GitHub : dcodemaxz"
            sleep 1
            echo
            if [ -f "vikaru-md" ]; then
                echo -e "  # ${success} This script already exists"|pv -qL 30
                sleep 1
            else
                echo -e "  • ${process} Installing vikaru-md..."|pv -qL 30
                echo -e $white " "
                git clone https://github.com/dcodemaxz/vikaru-md
                echo
                sleep 1
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
    echo -e $white "${line}"
    echo -e "  # ${question} Control button ${yellow}↑↓ ${white}- ${green}enter"
    echo -e $white "${line}"
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

    menu=("• [1] Vikaru.sh" "• [2] Vikaru-Ar" "• [3] Vikaru-Md" "• [0] Back")

    eval main
    main.setup

    # Handling user selection
    case "$choice" in
        1)
            cd /sdcard/Vikaru-Bot/
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
            echo -e $white "${line}"
            echo -e $green "• [/] Vikaru.sh :"
            echo -e $white
            if [ -d ".git" ]; then
                git config --global --add safe.directory /sdcard/Vikaru-Bot/
                git pull
                echo -e $white "${line}"
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
            cd /sdcard/Vikaru-Bot/
            if [ -d "vikaru-ar" ]; then
                cd /sdcard/Vikaru-Bot/vikaru-ar/
            else
                sleep 2
                clear
                echo -e "  # ${denied} This file may have been deleted/replaced."
                echo -e $white " "
                sleep 1
                mainupdate
            fi
            echo -e $yellow "# [/] Update..."|pv -qL 30
            echo -e $white "${line}"
            echo -e $green "• [/] vikaru-ar :"
            echo -e $white
            if [ -d ".git" ]; then
                git config --global --add safe.directory /sdcard/Vikaru-Bot/vikaru-ar/
                git pull
                echo -e $white "${line}"
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
            cd /sdcard/Vikaru-Bot/
            if [ -d "vikaru-md" ]; then
                cd /sdcard/Vikaru-Bot/vikaru-md
            else
                sleep 2
                clear
                echo -e "  # ${denied} This file may have been deleted/replaced."
                echo -e $white " "
                sleep 1
                mainupdate
            fi
            echo -e $yellow "# [/] Update..."|pv -qL 30
            echo -e $white "${line}"
            echo -e $green "• [/] vikaru-md :"
            echo -e $white
            if [ -d ".git" ]; then
                git config --global --add safe.directory /sdcard/Vikaru-Bot/vikaru-md/
                git pull
                echo -e $white "${line}"
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
