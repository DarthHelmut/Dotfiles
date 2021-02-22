
#
# ~/.bashrc
#

#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups


export MANPAGER="sh -c 'col -bx | bat -l man -p'"


export PS1="\[$(tput bold)\]\[\033[38;5;201m\]\u\[$(tput sgr0)\]: \[$(tput bold)\]\@\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;163m\]\w\[$(tput sgr0)\]\n>\[$(tput sgr0)\]"


if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# custom alias
alias nbspwm='nvim ~/.config/bspwm/bspwmrc'
alias nsxhkd='nvim ~/.config/sxhkd/sxhkdrc'
alias top='bpytop'
alias vi='doas nvim'
alias cat='bat'
alias ls='exa -lga'
alias sudo='doas'

#fix obvious typo's
alias cd..='cd ..'
alias pdw="pwd"
alias udpate='doas pacman -Syu'
alias upate='doas pacman -Syu'
alias updte='doas pacman -Syu'
alias updqte='doas pacman -Syu'
alias upqll="paru -Syu"
alias l='exa -lga'
alias sl='exa -lga'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='rg'

#readable output
alias df='df -h'

#pacman unlock
alias unlock="doas rm /var/lib/pacman/db.lck"
alias rmpacmanlock="doas rm /var/lib/pacman/db.lck"

#arcolinux logout unlock
alias rmlogoutlock="doas rm /tmp/arcologout.lock"

#free
alias free="free -mt"

#use all cores
alias uac="sh ~/.bin/main/000*"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman or pm
alias pacman='doas pacman --color auto'
alias update='doas pacman -Syu'

# yay as aur helper - updates everything
alias pksyua="paru -Syu"
alias upall="paru -Syu"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="doas grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='doas fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - backup of config created - beware
alias skel='cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/skel/* ~'
#backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

#copy bashrc-latest over on bashrc - cb= copy bashrc
alias cb='doas cp /etc/skel/.bashrc ~/.bashrc && source ~/.bashrc'
#copy /etc/skel/.zshrc over on ~/.zshrc - cb= copy zshrc
#alias cz='sudo cp /etc/skel/.zshrc ~/.zshrc && source ~/.zshrc'

#switch between bash and zsh
alias tobash="doas chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="doas chsh $USER -s /bin/zsh && echo 'Now log out.'"

#quickly kill conkies
alias kc='killall conky'

#hardware info --short
alias hw="hwinfo --short"


#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood
alias mirror="doas reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="doas reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="doas reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="doas reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="doas /usr/local/bin/arcolinux-vbox-share"

#shopt
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases

#youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "

alias ytv-best="youtube-dl -f bestvideo+bestaudio "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#Cleanup orphaned packages
alias cleanup='doas pacman -Rns $(pacman -Qtdq)'

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nano for important configuration files
#know what you do in these files
alias nlightdm="doas nvim /etc/lightdm/lightdm.conf"
alias npacman="doas nvim /etc/pacman.conf"
alias ngrub="doas nvim /etc/default/grub"
alias nconfgrub="doas nvim /boot/grub/grub.cfg"
alias nmkinitcpio="doas nvim /etc/mkinitcpio.conf"
alias nmirrorlist="doas nvim /etc/pacman.d/mirrorlist"
alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias downgrada="doas downgrade --ala-url https://bike.seedhost.eu/arcolinux/"

#systeminfo
alias probe="doas -E hw-probe -all -upload"

#shutdown or reboot
alias shutdown="doas shutdown now"
alias reboot="doas reboot"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#create a file called .bashrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal


