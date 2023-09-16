wall="$( find "$HOME/Pictures/lock" -type f -print0 | shuf -z -n 1 )" 
DISPLAY=:0 betterlockscreen -u "$wall" --desc "Password: 12345789" --off 5 --fx blur >> /dev/null &
notify-send -u low --app-name=Betterlockscreen "Betterlockscreen" "Updated lock screen $wall" -u low -i $wall
