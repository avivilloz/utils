
    sudo mkdir -p /etc/dconf/db/gdm.d/
    echo "\
    [org/gnome/desktop/peripherals/touchpad]
    tap-to-click=true" | sudo tee -a /etc/dconf/db/gdm.d/06-tap-to-click > /dev/null
