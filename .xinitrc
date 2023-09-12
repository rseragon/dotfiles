xset +fp /user/share/fonts/local &
xset fp rehash &
xrdb ~/.Xresources &
xsetroot -cursor_name left_ptr &

export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1
exec bspwm
