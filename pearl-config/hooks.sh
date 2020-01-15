
post_install() {
    warn "The following procedure will overwrite the file $HOME/.config/gtk-3.0/settings.ini"

    info "dot-gtk package requires fonts to be installed into the system."
    info "Use the fonts Pearl package:"
    info "> pearl install fonts"

    fontname=$(input "Which font would you like?" "Ubuntu")
    fontsize=$(input "Which font size would you like?" "10")
    sed -e "s/<FONTNAME>/$fontname/g" -e "s/<FONTSIZE>/$fontsize/g" "$PEARL_PKGDIR/gtkrc-template" > "$PEARL_PKGVARDIR/gtkrc"
    link gtk2 "$PEARL_PKGVARDIR/gtkrc"

    mkdir -p $HOME/.config/gtk-3.0
    echo "[Settings]" > $HOME/.config/gtk-3.0/settings.ini
    sed -e "s/\"//g" "$PEARL_PKGVARDIR/gtkrc" >> $HOME/.config/gtk-3.0/settings.ini
}

post_update() {
    post_install
}

pre_remove() {
    unlink gtk2 "$PEARL_PKGVARDIR/gtkrc"

    rm $HOME/.config/gtk-3.0/settings.ini
}
