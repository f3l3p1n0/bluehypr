#!/bin/bash

# Crear imagen temporal
tmp_img=$(mktemp --suffix=.png)

# Captura pantalla
grim -g "$(slurp)" "$tmp_img"

# Vaciar el portapapeles (poner texto vacío)
echo -n "" | wl-copy

# Ejecuta swappy en segundo plano
swappy -f "$tmp_img" &
swappy_pid=$!

# Esperar hasta que se copie una imagen (Ctrl+C en swappy)
while true; do
    sleep 0
    if wl-paste --no-newline --type image/png &>/dev/null; then
        # Imagen detectada, cerrar swappy
        kill "$swappy_pid" 2>/dev/null
        break
    fi
done

# Esperar a que swappy termine
wait "$swappy_pid"

# Borrar archivo temporal
rm "$tmp_img"
