# custom aliases

deployInstance() {
    #available: [ltecb-42, ltecb-78, ltecb-79]
    ssh -i ~/.ssh/id_rsa devel@esbmon01.emea.nsn-net.net "cd kszymans/development_instances/;git pull;source ~/euca-env/bin/activate;~/kszymans/development_instances/run_instance.sh --user $USER --type big --cloud $1"
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

venv() {
    venv_name_dir="$1"
    source ~/work/venv/${venv_name_dir}/bin/activate
}

ssho() {
    instance_name=$1
    ssh -t admin@esbmon01.emea.nsn-net.net -i ~/.ssh/id_rsa "./tmp/kszymans/log_me.sh ${instance_name}"
}

create_review() {
    task=$1
    venv cb-python
    python3 ~/work/repos/jira_interface/create-review.py $task
}

adminssh() {
    ssh -tt admin@esbmon01.emea.nsn-net.net -i ~/.ssh/id_rsa $@

}
stack_search() {
    string=$1
    export string
    ssh admin@esbmon01.emea.nsn-net.net -i ~/.ssh/id_rsa << "EOF"
        for account in $(grep -oP "ltecb-\d\d" /home/admin/.config/openstack/clouds.yaml); do 
            echo "Searching $string in: $account"
            openstack stack list --os-cloud=$account | grep "$string"
        done
EOF
}

 change-ns() {
    namespace=$1
    if [ -z $namespace ]; then
        echo "Please provide the namespace name: 'change-ns mywebapp'"
        return 1
    fi

    kubectl config set-context $(kubectl config current-context) --namespace $namespace
}

function current-ns() {
	kubectl get sa default -o jsonpath='{.metadata.namespace}'
	echo
}

alias proxy='source ~/.proxy/nokia_proxy'
alias admin=adminssh
alias cdmy='cd ~/work/'
alias g='find -L . -xtype f ! -wholename *.svn* -print0 | xargs -0 -n8 -P24 grep -I --color=auto'
alias malina='ssh pi@192.168.1.111'
