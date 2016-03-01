###########################
######   FUNCTIONS   ######
###########################

## Shell

# Portable ls with colors
if ls --color -d . >/dev/null 2>&1; then
  alias ls='ls --color=auto'  # Linux
elif ls -G -d . >/dev/null 2>&1; then
  alias ls='ls -G'  # BSD/OS X
fi

# Create and change dir
mcd () {
    mkdir -pv $1
    cd $1
}

# Tmux
function tat() {
  session_name=`basename ${1:-$PWD}`
  tmux new-session -As "$session_name"
}

# Node
nm () {
  env='development'

  if [[( $1 = 's' || $1 = 'staging' )]]; then
    env='staging'
  else
    if [[( $1 = 'p' || $1 = 'production' )]]; then
      env='production'
    fi
  fi

  eval "NODE_ENV='$env' nodemon server.js"
}

# Server
droplet () {
    addr='188.166.32.149'

    if [ -z '$1' ]
      then
        user='fabi'
    else
        user='$1'
    fi


    eval "ssh $user@$addr"
}

# minecraft backup

backup_minecraft () {
  eval "cd /Users/Fabi/Library/Application\ Support/minecraft/saves"
  eval "gaa"
  eval "gc"
  eval "gps"
  eval "cdd"
}
