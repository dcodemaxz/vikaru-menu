#!/data/data/com.termux/files/usr/bin/bash

# × ------------------------------------------------------------------------------ -
# -  Script by : dcodemaxz
# -  Github   : https://github.com/dcodemaxz/Vikaru-Bot
# -  Sosmed : https://linktr.ee/dcodemaxz
# × ------------------------------------------------------------------------------ -

# Lib ( Don't change it )
source .lib/app.sh
import.source [io:color.app, inquirer:list.app]
Namespace: [Std::Main STD::Log]

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
line="=───────────────────────────────="

# Directory definitions
DIR=$(pwd)
BOT_DIR="/sdcard/Vikaru-Bot"
TASKER_DIR="/data/data/com.termux/files/home/.termux/tasker"
TASKER_SH='#!/data/data/com.termux/files/usr/bin/bash

dir_bot="/sdcard/Vikaru-Bot/vikaru-md"

# Cek apakah proses npm start sudah berjalan
if pgrep -f "npm start" > /dev/null; then
  exit 1
fi

# Jalankan npm start di direktori yang ditentukan
cd ~ && cd "$dir_bot" && npm start'
ABOUT=" # Copyright © 2025 dcodemaxz | +6289508899033

 - By using this script you agree not to share this script. If a violation is discovered, the developer reserves the right to discontinue script development.

 - Users are permitted to modify this script as needed, however, the author is not responsible for any errors or damages resulting from modifications made by the buyer.

 - Any copies or substantial portions of this script must include the above copyright notice and this permission notice.

 本脚本按“原样”提供，不作任何形式的明示或暗示的保证，包括但不限于对适销性、特定用途的适用性和非侵权性的保证。在任何情况下，作者或版权持有人均不对任何索赔、损害或其他责任负责，无论是在合同、侵权或其他诉讼中，由本脚本或其使用或交易引起的、产生的或与之相关的。"


#=======================================#
#                MAIN START
#=======================================#


# Function to display header
show_header() {
    clear
    echo
    echo -e " \e[37m╭───────────────────────────────────────────────╮\e[0m"
    echo -e " \e[37m│\e[0m   \e[38;5;141mAuthor\e[0m : \e[37mdcodemaxz\e[0m                          \e[0m│\e[0m"
    echo -e " \e[37m│\e[0m   \e[38;5;141mSosmed\e[0m : \e[37mhttps://linktr.ee/dcodemaxz\e[0m        \e[0m│\e[0m"
    echo -e " \e[37m╰───────────────────────────────────────────────╯\e[0m"
    echo -e "\e[37m───────────────────────────────────────────────────\e[0m"
}

# Function to check and install resources
check_resources() {
    echo -e "  # ${error} Make sure your internet is not interrupted"
    read -r -s -p $'  • [\033[33m?\033[0m] Press \033[32menter\033[0m to continue...\n'
    local resources
    if [[ -z "$1" ]]; then
        # Jika tidak ada argumen, gunakan daftar default
        resources=("pv" "git" "figlet" "ffmpeg" "libwebp" "nodejs-lts")
        # "ruby" "ossp-uuid" "toilet"
        echo
        echo -e "  # ${process} Detect resource..."
        echo -e $white "${line}"
        sleep 1
    else
        # Jika ada argumen, anggap itu adalah array sumber daya
        resources=("${@}")
    fi

    for package_name in "${resources[@]}"; do
        if ! dpkg -s "$package_name" &> /dev/null; then
            echo -e "  • ${process} $package_name..."
            echo
            pkg install "$package_name" -y
            echo
            if [ $? -eq 0 ]; then
                echo -e "  • ${success} $package_name installed"
            else
                echo -e "  • ${error} Failed to install $package_name"
            fi
            echo
        else
            echo -e "  • ${success} $package_name"
        fi
    done
    sleep 1
    echo
}

# Function to adjust file location
detect_directory() {
    echo -e "  # ${process} Detect directory..."
    echo -e $white "${line}"
    sleep 1
    cd /sdcard/ || return 1
    if [ -d "Vikaru-Bot" ]; then
        echo -e "  • ${success} Vikaru-Bot detected."
        sleep 1
        clear
        return 0
    fi

    echo -e "  • ${process} Setting up Vikaru-Bot directory..."
    cd "$DIR/.." || return 1
    mv -i Vikaru-Bot /sdcard/ || { echo -e "  • ${error} Failed to move Vikaru-Bot directory."; return 1; }
    cd ~ || return 1
    mkdir -p "$TASKER_DIR" || { echo -e "  • ${error} Failed to create tasker directory."; return 1; }
    chmod 700 -R /data/data/com.termux/files/home/.termux || { echo -e "  • ${error} Failed to set permissions for .termux."; return 1; }
    cd "$TASKER_DIR" || return 1
    echo "$TASKER_SH" > "start.sh"
    chmod +x "start.sh" || { echo -e "  • ${error} Failed to make start.sh executable."; return 1; }
    echo -e "  • ${success} File location successfully adjusted"|pv -qL 30
    echo -e $white "${line}"
    sleep 2
    echo -e "  # ${error} Start this cmd :"
    echo
    echo -e $white " cd /sdcard/Vikaru-Bot && bash vikaru.sh"|pv -qL 30
    exit
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

    menu=("• [1] Start" "• [2] Install" "• [3] Update" "• [4] About" "• [0] Exit")

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
        4)
            clear
            show_header
            echo -e "${ABOUT}"
            echo
            echo -e "  # ${error} Thank you for reading the privacy policy.."
            read -r -s -p $'  • [\033[33m?\033[0m] Press \033[32menter\033[0m to back...\n'
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

# Vikaru-start
mainstart() {
    cd "$BOT_DIR/vikaru-md" || { echo -e "  # ${denied} vikaru-md not found!"|pv -qL 30; sleep 1; mainmenu; return 1; }

    check_status() {
        if [[ -f "index.js" ]]; then
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
        echo -e "$white"

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
                echo -e "  # ${error} index.js ${red}not found${white} in directory: $BOT_DIR/vikaru-md."
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
}

# Function to install a bot
install_bot() {
    local bot_name="$1"
    local repo_url="$2"
    cd "$BOT_DIR" || return 1
    echo -e -n $blue;figlet "  $(echo "$bot_name" | sed 's/-/\ /g' | sed 's/\b\w/\u&/g')"
    echo -e $white "${line}"
    echo -e "  Author : dcodemaxz"
    echo -e "  GitHub : dcodemaxz"
    sleep 1
    echo
    if [ -d "$bot_name" ]; then
        echo -e "  # ${success} This script already exists"|pv -qL 30
        sleep 1
    else
        echo -e "  • ${process} Install $bot_name..."|pv -qL 30
        sleep 1
        echo -e $white
        git clone "$repo_url"
        echo
        echo -e "  # ${success} Succssesfully"|pv -qL 30
        sleep 2
    fi
    cd "$DIR" || return 1
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
            install_bot "vikaru-ar" "https://github.com/dcodemaxz/vikaru-ar"
            maininstall
            ;;
        2)
            clear
            install_bot "vikaru-md" "https://github.com/dcodemaxz/vikaru-md"
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

# Function to update a component
update_component() {
    local component_name="$1"
    local target_dir="$BOT_DIR/$component_name"
    cd "$target_dir" || { echo -e "  # ${denied} Directory $target_dir not found!"|pv -qL 30; sleep 1; return 1; }

    echo -e "  # ${process} Update..."|pv -qL 30
    echo -e $white "${line}"
    echo -e $white
    if [ -d ".git" ]; then
        git config --global --add safe.directory "$target_dir"
        if git pull; then
            echo -e $white
            echo -e $white "${line}"
            sleep 1
            echo -e "  # ${success} Succssesfully"|pv -qL 30
            sleep 2
            clear
            if [[ "$component_name" == "vikaru.sh" ]]; then
                echo -e "  # ${error} Please restart this tool :"
                echo
                echo -e $white " bash vikaru.sh"|pv -qL 30
                exit
            fi
            cd "$DIR" || return 1
            return 0
        else
            echo -e "  # ${error} Failed to update $component_name"|pv -qL 30
            sleep 2
            cd "$DIR" || return 1
            return 1
        fi
    else
        sleep 2
        clear
        echo -e "  # ${denied} The '.git' file has been deleted!"|pv -qL 30
        sleep 1
        echo
        cd "$DIR" || return 1
        return 1
    fi
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

    menu=("• [1] Vikaru-Menu" "• [2] Vikaru-Ar" "• [3] Vikaru-Md" "• [0] Back")

    eval main
    main.setup

    # Handling user selection
    case "$choice" in
        1)
            clear
            update_component "vikaru.sh"
            mainupdate
            ;;
        2)
            clear
            update_component "vikaru-ar"
            mainupdate
            ;;
        3)
            clear
            update_component "vikaru-md"
            mainupdate
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

# Start vikaru.sh
show_header
check_resources
detect_directory
mainmenu
