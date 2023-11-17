# Refer: https://discussion.fedoraproject.org/t/graphical-applications-cant-be-run-as-root-in-wayland/75412
xhost si:localuser:root

trap ctrl_c_handler INT

function ctrl_c_handler() {
    echo "Handling ^c"
    xhost -si:localuser:root
}

`$@`


