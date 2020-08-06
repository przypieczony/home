# custom aliases
venv() {
    venv_name_dir="$1"
    source ~/work/venv/${venv_name_dir}/bin/activate
}


adminssh() {
    ssh -tt admin@esbmon01.emea.nsn-net.net -i ~/.ssh/id_rsa $@

}

alias proxy='source ~/.proxy/nokia_proxy'
alias admin=adminssh
alias cdmy='cd ~/work/'
alias g='find -L . -xtype f ! -wholename *.svn* -print0 | xargs -0 -n8 -P24 grep -I --color=auto'
alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'
alias malina='ssh pi@raspberrypi.local'
alias malina_nfs='sudo mount -t nfs raspberrypi.local:/media/pi/dlna_storage /mnt/malina/'
