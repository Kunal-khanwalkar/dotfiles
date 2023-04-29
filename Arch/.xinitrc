[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &
~/.fehbg &
brightnessctl set 40% &
exec i3 
