#########################
######   ALIASES   ######
#########################

# Management
alias dots='cd ~/.dotfiles && vim'
alias ra='cd ~/.dotfiles && rake && source ~/.bash_profile && echo "reloaded dotfiles"'
alias redot='cd ~/.dotfiles && gpp && rake install; cd -'
alias alias+='vim ~/.dotfiles/bash/aliases.sh'



# Shell
alias la='ls -lah'
alias cdd='cd -' # back to last directory
alias pg='ps aux | head -n1; ps aux | grep -i'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd..='cd ..'
alias mkdir='mkdir -pv' #create parents if needed
alias mv='mv -i' #move ask if overwrite

alias apt-get='apt-get sudo'

# Project navigation
alias fh='cd ~/Google\ Drive/fh/6.Semester'
alias godev='cd ~/Sites'
alias vcard='cd ~/dev/projects/vcard'
alias mink='cd ~/Sites/niftymink'
alias fhvm='ssh fhoffmann@fhoffmann.mmt-b2013.multimediatechnology.at -p 5412'
alias chillaid='cd ~/Sites/chillaid'
alias pi='ssh pi@fabianfynn.ddns.net'

# Network
alias ip="ifconfig|grep broadcast"  # List IPs
alias hosts='sudo vim /etc/hosts'

# Git
alias g='git'
alias gs='git status'
alias gl='git log'
alias gw='git show'
alias gw^='git show HEAD^'
alias gw^^='git show HEAD^^'
alias gd='git diff HEAD'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit --no-verify'
alias gcm='git commit --no-verify -m'
alias gpp='git pull --rebase && git push'
alias gpl='git pull'
alias gps='git push'
alias go='git checkout'
alias gb='git checkout -b'
alias got='git checkout -'
alias gom='git checkout master'
alias gbr='git branch -d'
alias gcount='eval "git rev-list HEAD --count"'
alias gra='git remote add'

# Rails
alias be='bundle exec'
alias rdm='rake db:migrate'
alias rdr='rake db:reset'

# Heroku
alias h='heroku'
alias hp='heroku push'
alias hmig='heroku run rake db:migrate'
alias ho='heroku open'
alias hc='heroku run console'
alias hlog='heroku logs -t'

# Tools
alias mysql='sudo /usr/local/mysql/support-files/mysql.server'
alias pgstart='sudo postgres -D /usr/local/var/postgres'
alias mongo='mongod --config /usr/local/etc/mongod.conf'
alias sass='sass --watch scss:css'

# Tmux
alias tls='tmux ls'
alias tks='tmux kill-session -t'

# Game backups
alias bmc='backup_minecraft'
alias mcpath='cd /Users/Fabi/Library/Application\ Support/minecraft/saves'

# Server only
alias proj='cd /home/deploy/projects'
alias ngx='cd /etc/ngnix/'
alias ngxvhost='sudo vim /etc/nginx/sites-available/lamp.fabianhoffmann.io'
alias ngxRsf='ngxReload && ngxRestart'
alias ngxRestart='sudo service nginx restart'
alias ngxReload='sudo service nginx reload'
alias ngxLog='sudo cat /var/log/nginx/error.log'

# Others
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
export PATH=$PATH:/usr/local/sbin;

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -d "<path-to-sdk>/platform-tools" ] ; then
  export PATH="<path-to-sdk>/platform-tools:$PATH"
fi

[[ -s "$HOME/.bs/profile" ]] && source "$HOME/.bs/profile"
#source ~/.bash_functions
