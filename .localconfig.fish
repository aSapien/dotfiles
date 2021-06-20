
##### AWS #####
# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

# Start Kali
alias kalistart='aws ec2 start-instances --instance-ids i-0dff7a7d11250ddd7 && aws ec2 describe-instances --instance-ids i-0dff7a7d11250ddd7'

### NODE ###

# fnm
fnm env --multi | source

##### AUTOJUMP ####
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish


##### Go #####
export GOPATH="$HOME/.go"
export GOROOT=/usr/local/opt/go/libexec
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

##### BAZEL #####

source /Users/dimaryskin/.bazelenv

##### ALIASES #####

# Kube Aliases

# switch between dcs
# Usage: `kc 96`
alias kc='kubectl config use-context '

# set default namespace for other commands
# Usage: `kn premium`
alias kn='kubectl config set-context --current --namespace '

# get pods by keyword in current namespace
# Usage: `kgp premium-offerings`
alias kgp='kubectl get pods -o wide | grep '

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
