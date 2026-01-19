# Hypr Wallpaper

Hypr Wallpaper is a bash script meant to provide an easier experience when selecting wallpapers in Hyprland. Regardless of how many monitors you have.

## Installation

Create a /Pictures/Wallpapers directory in your $HOME directory.

```bash
mkdir /Pictures/Wallpapers
```

Download and execute the randomWallpaper.sh script to instantly have backgrounds from your ```/Wallpapers``` directory displayed on your monitor(s). 

```bash
./randomWallpaper.sh
```

Add the following line to your ```hyprland.conf```:
```bash
exec-once = ~/path/to/randomWallpaper.sh
```

## Updates

I plan on creating a GUI application to allow for selecting specific wallpapers for individual monitor(s). That is the end goal of this project.

## License

[MIT] (https://choosealicense.com/licenses/mit/)
