# .bashrc

alias lc='colorls -lA --sd'
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#history completition using fzf

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# my prompt

PS1="\[\033[32m\]  \[\033[37m\]\[\033[34m\]\w \[\033[0m\]"
PS2="\[\033[32m\]  > \[\033[0m\]"

PATH=$PATH:~/.local/bin/:/home/anon/.config/scripts:/home/anon/.emacs.d/bin

# unlimted bash history 
HISTSIZE=
HISTFILESIZE=

# Aliases
alias ree='redshift -P -O 3333'
alias zz='doas zzz'
alias del='doas rm -r'

# sx xinitrc commands
alias bsp='sx sh ~/.xinitrc bsp'
alias ice='sx sh ~/.xinitrc ice'

alias doo='doas'
alias ttc='tty-clock -c -C 7 -r -f "%A, %B %d"'

# mpd aliases to stop / run
alias kek=" killall mpd ncmpcpp ncmpcpp_cover_art.sh"
alias mpd=" mpd && ~/.ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug"
alias mpdd="kek && mpd"

# youtube-dl to download stuffs
alias yt='youtube-dl --extract-audio --add-metadata --xattrs --embed-thumbnail --audio-quality 0 --audio-format mp3'
alias ytv='youtube-dl --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" --embed-thumbnail --add-metadata'

# check mem
alias pmem='doo ps_mem.py'

alias feh="feh --bg-fill"
alias use="xrdb merge " 
alias load="kill -USR1 $(pidof st)"

export LC_ALL="en_US.UTF-8"
