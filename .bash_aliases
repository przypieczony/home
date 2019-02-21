# custom aliases

deployInstance() {
    ssh -i ~/.ssh/id_rsa devel@esbmon01.emea.nsn-net.net "cd kszymans/development_instances/;git pull;source ~/euca-env/bin/activate;~/kszymans/development_instances/run_instance.sh --user $USER --type $1"
}

lteUpdate() {
    svn export --force "$svne/isource/svnroot/BTS_SCM_LTE/internal_scripts/branches/development/kszymans/lte_update/update.sh"
    if [[ ${1} == "remove" ]]; then
        ./update.sh -r ${2}
    else
        ./update.sh -f $1 $2
    fi
}

notify() {
    notify-send ${1}; paplay ~/Music/notify.ogg
}

slash() {
    path="${1}"
    echo "${path}" | sed 's/\\/\//g'
}

ssh.() {
    destinationHost=${1}
    ssh admin@esbmon01.emea.nsn-net.net -tt  ssh -tt ${destinationHost}
}

venv() {
    venv_name_dir="$1"
    source ~/work/venv/${venv_name_dir}/bin/activate
}

ssho() {
    instance_name=$1
    ssh -t admin@esbmon01.emea.nsn-net.net -i ~/.ssh/id_rsa "./tmp/kszymans/log_me.sh ${instance_name}"
}

alias proxy='source ~/.proxy/nokia_proxy'
alias esrdsbtsciv50='ssh -i ~/.ssh/esrdsbtsciv50_rsa root@esrdsbtsciv50.emea.nsn-net.net'
alias esrdsbtsciv52='ssh -i ~/.ssh/esrdsbtsciv50_rsa root@esrdsbtsciv52.emea.nsn-net.net'
alias esrdsbtsci50='ssh sbtnsn@esrdsbtsci50.emea.nsn-net.net'
alias ansible_espoo='ssh ansible@esbmon01.emea.nsn-net.net -i ~/.ssh/id_rsa'
alias admin='ssh admin@esbmon01.emea.nsn-net.net -i ~/.ssh/id_rsa'
alias production='ssh -i ~/.ssh/790sceurity maintenance@esbmon01.emea.nsn-net.net'
alias eucatools='source ~/work/venv/eucatools/bin/activate'
alias cdmy='cd ~/work/'
alias g='find -L . -xtype f ! -wholename *.svn* -print0 | xargs -0 -n8 -P24 grep -I --color=auto'
alias malina='ssh pi@192.168.1.111'

