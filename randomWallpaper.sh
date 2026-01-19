#!bin/bash
WALLPAPER_DIR = "$HOME/Pictures/Wallpapers"

mkdir -p "$WALLPAPER_DIR"
if [-z "$(ls -A "$WALLPAPER_DIR")"]; then
  echo "Directory $WALLPAPER_DIR is empty."
  echo "Please add some images or GIFS to the folder and run the script again."
  exit 1
fi

DEPENDENCIES = ("swww" "awk" "findutils")

# DEPENDENCY CHECK
for pkg in "${DEPENDENCIES[@]}"; do 
  if ! pacman -Qi "$pkg" & > /dev/null; then
    echo "Package '$pkg' is missing. Installing..."
    sudo pacman -S --noconfirm "$pkg"
  else
    echo "$pkg is already installed."
  fi
done

# WALLPAPER LOGIC (explained in-depth in README.md)
swww-daemon --format xrgb &>/dev/null &
sleep 1
MONITORS = $(hyprctl monitors | grep "Monitor" | awk '{print $2}')
for MONITOR IN $MONITORS; do
  RANDOM_WALL = $(find "WALLPAPER_DIR" -type f \( -iname "*jpg" -o -iname "*.png" -o iname "*.gif" -o -iname "*.webp" \) | shuf -n 1)
  sww img -o "$MONITOR" "$RANDOM_WALL" --transition-type wipe
done

echo "Wallpapers updated successfully!"
