#!/bin/bash

                        ############################################################################################################################
                        #                                                   SCRIPT BY F3L3P1N0                                                     #
                        ############################################################################################################################

# AUTOR
function autor() {
    echo -e "\n\e[1;36m         #####################################################"
    echo "         #                 SCRIPT BY F3L3P1N0                #"
    echo -e "         #####################################################\e[0m\n"
}

# MENSAJE
function mensaje() {
    echo -e "\n\e[1;33mInstalando archivos de configuración. Espere...\e[0m\n"
}

# Variables de progreso
total_steps=17
current_step=0
success_color="\e[32m"
error_color="\e[31m"
reset_color="\e[0m"

# Función para imprimir pasos con puntos dinámicos
print_step() {
    local step_name=$1
    local total_length=60
    local step_length=${#step_name}
    local dots_length=$((total_length - step_length - 3))
    ((dots_length < 0)) && dots_length=0
    local dots=$(printf "%0.s•" $(seq 1 $dots_length))
    printf "  \e[1;34m%s \e[0;36m%s" "$step_name" "$dots"
}

# Función para actualizar la barra de progreso
update_progress() {
    local percent=$((current_step * 100 / total_steps))
    local filled=$((current_step * 50 / total_steps))
    local bar=$(printf "${success_color}%0.s█" $(seq 1 $filled))
    local empty=$(printf "\e[0;37m%0.s░" $(seq 1 $((50 - filled))))
    tput sc
    tput cup $(($(tput lines))) 0
    echo -ne "  Progreso: ${bar}${empty}${reset_color} ${percent}%"
    tput rc
}

# COPIA DE ARCHIVOS DE CONFIGURACIÓN
function copia() {
    echo -e "\n"
    tput sc

    # Crear .config
    print_step "Creando .config"
    mkdir -p "$HOME/.config" >/dev/null 2>&1
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Neofetch
    print_step "Configurando Neofetch"
    rm -rf "$HOME/.config/neofetch" >/dev/null 2>&1
    mkdir -p "$HOME/.config/neofetch"
    cp -r $1/dotfiles/neofetch/* "$HOME/.config/neofetch/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Kitty
    print_step "Configurando Kitty"
    mkdir -p "$HOME/.config/kitty"
    cp -r $1/dotfiles/kitty/* "$HOME/.config/kitty/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Hyprland
    print_step "Configurando Hyprland"
    mkdir -p "$HOME/.config/hypr"
    cp -r $1/dotfiles/hypr/* "$HOME/.config/hypr/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Wallpaper
    print_step "Estableciendo wallpaper"
    mkdir -p "$HOME/Images"
    cp $1/dotfiles/wallpaper.png "$HOME/Images/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Waybar
    print_step "Configurando Waybar"
    mkdir -p "$HOME/.config/waybar"
    cp -r $1/dotfiles/waybar/* "$HOME/.config/waybar/"
    chmod +x "$HOME/.config/waybar/scripts/"*
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Dunst
    print_step "Configurando Dunst"
    mkdir -p "$HOME/.config/dunst"
    cp -r $1/dotfiles/dunst/* "$HOME/.config/dunst/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Rofi
    print_step "Configurando Rofi"
    mkdir -p "$HOME/.config/rofi"
    cp -r $1/dotfiles/rofi/* "$HOME/.config/rofi/"
    chmod +x "$HOME/.config/rofi/powermenu/powermenu"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Zsh
    print_step "Configurando Zsh"
    sudo usermod --shell /usr/bin/zsh $USER >/dev/null 2>&1
    sudo usermod --shell /usr/bin/zsh root >/dev/null 2>&1
    cp -r "$1/dotfiles/.zshrc" "$HOME/"
    sudo ln -sf "$HOME/.zshrc" "/root/.zshrc"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Powerlevel10k
    print_step "Instalando Powerlevel10k"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k >/dev/null 2>&1
    sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/powerlevel10k >/dev/null 2>&1
    cp -r $1/dotfiles/powerlevel10k/user/.p10k.zsh "$HOME/"
    sudo cp -r $1/dotfiles/powerlevel10k/root/.p10k.zsh "/root/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Plugin sudo
    print_step "Instalando plugin sudo"
    sudo mkdir -p /usr/share/zsh-sudo
    sudo chown -R $USER:$USER /usr/share/zsh-sudo
    wget -q https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh -P /usr/share/zsh-sudo/
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Fuentes
    print_step "Descargando fuentes"
    mkdir -p "$1/dotfiles/fonts"
    megadl --print-names https://mega.nz/file/GxFVSLLY#etuNc6QRrEl6wgl_ZatvomojDhkBTFPqlKS7ELk7KAM --path="$1/dotfiles/fonts/" >/dev/null 2>&1
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    print_step "Instalando fuentes"
    sudo cp -r $1/dotfiles/fonts/* "/usr/share/fonts/"
    sudo unzip -oq /usr/share/fonts/fonts.zip -d /usr/share/fonts/ >/dev/null 2>&1
    sudo rm -f /usr/share/fonts/fonts.zip
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Scripts
    print_step "Configurando scripts"
    mkdir -p "$HOME/.config/scripts"
    cp -r $1/dotfiles/scripts/* "$HOME/.config/scripts"
    chmod +x -R "$HOME/.config/scripts/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Swappy
    print_step "Configurando Swappy"
    mkdir -p "$HOME/.config/swappy"
    cp -r $1/dotfiles/swappy/* "$HOME/.config/swappy"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Swaylock
    print_step "Configurando Swaylock"
    mkdir -p "$HOME/.config/swaylock"
    cp -r $1/dotfiles/swaylock/* "$HOME/.config/swaylock"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # SDDM
    print_step "Configurando SDDM"
    sudo systemctl enable sddm >/dev/null 2>&1
    sudo mkdir -p "/usr/share/sddm/themes/Sugar-Candy/Backgrounds"
    sudo cp $1/dotfiles/sddm/wallpaper.png "/usr/share/sddm/themes/Sugar-Candy/Backgrounds/"
    sudo cp $1/dotfiles/sddm/theme.conf "/usr/share/sddm/themes/Sugar-Candy/"
    sudo cp $1/dotfiles/sddm/sddm.conf "/etc/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress
}

# FINALIZACIÓN
function finalizacion() {
    echo -e "\n\e[1;32mINSTALACIÓN COMPLETADA\e[0m"
    echo -e "\n\e[1;33mRecomendación: Reinicie su sistema para aplicar todos los cambios.\e[0m\n"
}

# Ejecución principal
autor
mensaje
copia "$(pwd)"
finalizacion
