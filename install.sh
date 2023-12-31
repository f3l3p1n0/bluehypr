#!/bin/bash

                        ############################################################################################################################
                        #                                                   SCRIPT BY F3L3P1N0                                                     #
                        ############################################################################################################################

# AUTOR

function autor() {
    echo ""
    echo "         #####################################################"
    echo "         #                 SCRIPT BY F3L3P1N0                #"
    echo "         #####################################################"
    echo ""
}

# MENSAJE

function mensaje() {
    echo ""
    echo "Instalando y configurando. Espere..."
    echo ""
}

# COPIA DE TODOS LOS ARCHIVOS DE CONFIGURACIÓN

function copia() {
    # creacion del directorio .config
    printf ".config......................"
    mkdir "$HOME/.config" > /dev/null 2>&1
    echo -e "\e[32mOK\e[0m"

    # neofetch
    printf "Neofetch....................."
    rm -rf "$HOME/.config/neofetch" > /dev/null 2>&1
    mkdir "$HOME/.config/neofetch"
    cp -r $1/dotfiles/neofetch/* "$HOME/.config/neofetch/"
    echo -e "\e[32mOK\e[0m"

    # kitty
    printf "Kitty........................"
    mkdir "$HOME/.config/kitty"
    cp -r $1/dotfiles/kitty/* "$HOME/.config/kitty/"
    echo -e "\e[32mOK\e[0m"

    # hyprland & hyprpaper
    printf "Hyprland....................."
    mkdir "$HOME/.config/hypr"
    cp -r $1/dotfiles/hypr/* "$HOME/.config/hypr/"
    echo -e "\e[32mOK\e[0m"

    # wallpaper
    printf "Wallpaper...................."
    mkdir "$HOME/Images"
    cp -r $1/dotfiles/wallpaper.png "$HOME/Images/"
    echo -e "\e[32mOK\e[0m"

    # waybar
    printf "Waybar......................."
    mkdir "$HOME/.config/waybar"
    cp -r $1/dotfiles/waybar/* "$HOME/.config/waybar/"
    chmod +x "$HOME/.config/waybar/scripts/mediaplayer.py" "$HOME/.config/waybar/scripts/wlrecord.sh"
    chmod +x "$HOME/.config/waybar/scripts/playerctl/playerctl.sh"
    echo -e "\e[32mOK\e[0m"

    # dunst
    printf "Dunst........................"
    mkdir "$HOME/.config/dunst"
    cp -r $1/dotfiles/dunst/* "$HOME/.config/dunst/"
    echo -e "\e[32mOK\e[0m"

    # rofi
    printf "Rofi........................."
    mkdir "$HOME/.config/rofi"
    cp -r $1/dotfiles/rofi/* "$HOME/.config/rofi/"
    chmod +x "$HOME/.config/rofi/powermenu/powermenu"
    echo -e "\e[32mOK\e[0m"

    # zsh
    printf "Zsh.........................."
    sudo usermod --shell /usr/bin/zsh $USER > /dev/null 2>&1
    sudo usermod --shell /usr/bin/zsh root > /dev/null 2>&1
    cp -r "$1/dotfiles/.zshrc" "$HOME/"
    sudo ln -s -f "$HOME/.zshrc" "/root/.zshrc"
    echo -e "\e[32mOK\e[0m"

    # powerlevel10k
    printf "Powerlevel10k................"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k > /dev/null 2>&1
    sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/powerlevel10k > /dev/null 2>&1
    cp -r $1/dotfiles/powerlevel10k/user/.p10k.zsh "$HOME/"
    sudo cp -r $1/dotfiles/powerlevel10k/root/.p10k.zsh "/root/"
    echo -e "\e[32mOK\e[0m"

    # plugin sudo
    printf "Plugin sudo.................."
    cd /usr/share
    sudo mkdir zsh-sudo
    sudo chown $USER:$USER zsh-sudo/
    cd zsh-sudo
    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh > /dev/null 2>&1
    echo -e "\e[32mOK\e[0m"

    # descarga de fuentes
    printf "Descargando fuentes.........."
    mkdir "$1/dotfiles/fonts"
    cd $1/dotfiles/fonts
    megadl --print-names https://mega.nz/file/GxFVSLLY#etuNc6QRrEl6wgl_ZatvomojDhkBTFPqlKS7ELk7KAM > /dev/null 2>&1
    echo -e "\e[32mOK\e[0m"

    # fonts
    printf "Copiando fuentes............."
    sudo cp -r $1/dotfiles/fonts/* "/usr/share/fonts/"
    cd /usr/share/fonts/
    sudo unzip fonts.zip > /dev/null 2>&1
    sudo rm -rf fonts.zip  > /dev/null 2>&1
    echo -e "\e[32mOK\e[0m"

    # scripts
    printf "Scripts......................"
    mkdir "$HOME/.config/scripts"
    cp -r $1/dotfiles/scripts/* "$HOME/.config/scripts"
    chmod +x -R $HOME/.config/scripts/
    echo -e "\e[32mOK\e[0m"

    # swappy
    printf "Swappy......................."
    mkdir "$HOME/.config/swappy"
    cp -r $1/dotfiles/swappy/* "$HOME/.config/swappy"
    echo -e "\e[32mOK\e[0m"

    # swaylock
    printf "Swaylock....................."
    mkdir "$HOME/.config/swaylock"
    cp -r $1/dotfiles/swaylock/* "$HOME/.config/swaylock"
    echo -e "\e[32mOK\e[0m"

    # sddm
    printf "Sddm........................."
    sudo systemctl enable sddm > /dev/null 2>&1
    sudo cp -r "$1/dotfiles/sddm/wallpaper.png" "/usr/share/sddm/themes/Sugar-Candy/Backgrounds/"
    sudo cp -r "$1/dotfiles/sddm/theme.conf" "/usr/share/sddm/themes/Sugar-Candy/"
    sudo cp -r "$1/dotfiles/sddm/sddm.conf" "/etc/"
    echo -e "\e[32mOK\e[0m"
}

# INSTALACION DE REQUERIMIENTOS

function requerimientos() {
    # Update
    printf "Actualizando................."
    sudo pacman -Syu --noconfirm > /dev/null 2>&1
    echo -e "\e[32mOK\e[0m"

    # yay
    printf "Yay.........................."
    git clone https://aur.archlinux.org/yay-git.git > /dev/null 2>&1
    cd yay-git
    makepkg --noconfirm -si > /dev/null 2>&1
    echo -e "\e[32mOK\e[0m"
}

# INSTALACION DE TODOS LOS PAQUETES

function paquetes() {
    # hyprland kitty wl-clip-persist swaylock-effects sddm-theme-sugar-candy-git
    printf "Instalando paquetes yay......"
    yay -S --noconfirm hyprland kitty wl-clip-persist swaylock-effects sddm-theme-sugar-candy-git > /dev/null 2>&1
    echo -e "\e[32mOK\e[0m"

    # rofi sddm zsh lsd bat zsh-syntax-highlighting zsh-autosuggestions swayidle xautolock hyprpaper waybar polkit polkit-gnome nemo pavucontrol slurp grim swappy neofetch megatools wget unzip
    printf "Instalando paquetes pacman..."
    sudo pacman -S --noconfirm rofi sddm zsh lsd bat zsh-syntax-highlighting zsh-autosuggestions swayidle xautolock hyprpaper waybar polkit polkit-gnome nemo pavucontrol slurp grim swappy neofetch megatools wget unzip > /dev/null 2>&1
    echo -e "\e[32mOK\e[0m"
}

# FINALIZACION

function finalizacion() {
    echo ""
    echo "INSTALACIÓN FINALIZADA"
    echo ""
}

# SE COMPRUEBA SI EL INSTALADOR SE EJECUTA COMO ROOT

if [ $(whoami) != 'root' ]; then
    ruta=$(pwd)
    sudo touch /tmp/hyprv.tmp
    autor
    mensaje
    requerimientos
    paquetes
    copia "$ruta"
    finalizacion
else
    echo 'Error, el script no debe ser ejecutado como root.'
    exit 0
fi


