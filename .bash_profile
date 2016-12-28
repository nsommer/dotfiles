# rbenv is installed via homebrew, however this is still needed:
eval "$(rbenv init -)"

# Aliases

# Enable colors.
alias ls='ls -G'
alias ll='ls -al'
alias pw='pwgen -nBsc'

# Shim the npm binary to enable custom command `npm exec`.
npm_shim() {
  # Make real npm calls with full path, otherwise the alias is called recursively.
  npm_binary=$(which npm)

  if [ $# -eq 0 ]
  then
    $npm_binary
  elif [ $# -eq 1 ]
  then
    if [ $1 = 'exec' ]
    then
      echo "Binary parameter missing."
    else
      $npm_binary $1
    fi
  else
    if [ $1 = 'exec' ]
    then
      # Execute locally installed binary with all arguments.
      args=($@)
      unset args[0]
      unset args[1]
      eval "./node_modules/.bin/$2 ${args[*]}"
    else
      # Execute npm with all arguments.
      eval "$npm_binary $@"
    fi
  fi
}

alias npm='npm_shim'
