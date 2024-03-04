if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit snippet PZTM::history/init.zsh
zinit snippet PZTM::osx/init.zsh

zinit wait lucid for \
  OMZL::git.zsh \
  atload"unalias grv" \
  OMZP::git

zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::spectrum.zsh
zinit snippet OMZL::theme-and-appearance.zsh

zinit snippet OMZP::tmux

zinit wait lucid atinit"zicompinit; zicdreplay" blockf for \
  zsh-users/zsh-syntax-highlighting

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:git:dirty color yellow

autoload -Uz zmv


export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin"
export LANG=ja_JP.UTF-8


if which nvim > /dev/null; then
  export EDITOR='nvim'
  alias vim="nvim"
  alias v="nvim"
else
  export EDITOR='vim'
  alias v="vim"
fi



test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

function allupdate() {
  brew upgrade && brew update && brew cleanup &&
  pip-review --auto &&
  ~/.tmux/plugins/tpm/bin/update_plugins all &&
  zinit self-update &&
  zinit update --parallel &&
  nvim --headless "+Lazy! sync" +qa
}

alias re="source ~/.zshrc"

### ctags
alias ctags="`brew --prefix`/bin/ctags"


### git
alias ggfpush='git push --force-with-lease --force-if-includes origin $(git_current_branch)'
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
alias gui='gitui'


### rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
# if which rbenv > /dev/null; then
#   eval "$(rbenv init -)"
# fi


### docker
alias doc="docker"
alias doc-com="docker compose"
alias doc-com-r="docker compose run"
docrm() { docker rm $(docker ps -a -q); }
docrmi() { docker rmi $(docker images | awk '/^<none>/ { print $3 }'); }
rails_id() { docker ps -a | grep api | grep rails | awk '{print $1}'; }


### tmux
unsetopt share_history


### zoxide
eval "$(zoxide init zsh)"
alias j="z"
alias ji="zi"


### fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(blue)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

# fcoc - checkout git commit with previews
fcoc() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" ) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fshow - git commit browser with previews
fshow() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
                --header "enter to view, ctrl-y to copy hash" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "ctrl-y:execute:$_gitLogLineToHash | pbcopy"
}

# frepo - find ghq repo
frepo() {
  local dir
  dir=$(ghq list > /dev/null | fzf-tmux --reverse +m) &&
    cd $(ghq root)/$dir
}

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf-tmux --reverse +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbrr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fbrr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# fuzzy grep open via rg
vg() {
  local file

  file="$(rg --no-heading $@ | fzf -0 -1 | awk -F: '{print $1}')"

  if [[ -n $file ]]
  then
     vim $file
  fi
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Select a docker container to attach to
function da() {
  local cid
  cid=$(docker ps | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker attach "$cid"
}

# fpr - Show a PR
fspr() {
  local num
  num=$(hub pr list > /dev/null | fzf-tmux --reverse +m | awk '{print $1}' | sed -e "s/#//g") &&
    hub pr show $num
}

fcpr() {
  local num
  num=$(hub pr list > /dev/null | fzf-tmux --reverse +m | awk '{print $1}' | sed -e "s/#//g") &&
    hub pr checkout $num
}

# fissue - Show a Issue
fissue() {
  local num
  num=$(hub issue > /dev/null | fzf-tmux --reverse +m | awk '{print $1}' | sed -e "s/#//g") &&
    hub issue show $num
}

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

### node.js
# export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'


### rails
alias be="bundle exec"
alias devlog='tail -f log/development.log'
alias prodlog='tail -f log/production.log'
alias testlog='tail -f log/test.log'


### android
# export ANDROID_HOME=/usr/local/opt/android-sdk
# export PATH="$PATH:/Applications/Genymotion.app/Contents/MacOS/tools/"
# export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"


### logbook
function lb() {
  x="+0"
  if [[ ! -z "$1" ]]; then
    x=$1
  fi
  $EDITOR ~/logbook/$(date -v "${x}d" '+%Y/%m/%d').md
}


### ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"


### VSCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


### anyenv
if [ -d ${HOME}/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  for D in `ls $HOME/.anyenv/envs`
  do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi


### direnv
eval "$(direnv hook zsh)"


### hub
alias hubb="hub browse"
alias hubbi="hub browse -- issues"
alias hubbp="hub browse -- pulls"


### bat
alias cat="bat"
export BAT_THEME="OneHalfDark"


### rust
export PATH="$PATH:$HOME/.cargo/bin"


### glow
alias glow="glow -s dark"


### go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


### spotify
alias sp="spotify"
alias spp="spotify play"
alias sps="spotify stop"
alias spn="spotify next"
alias sppp="spotify prev"


### flutter
# export PATH=$PATH:$HOME/dev/flutter/bin


### C++
export PATH="/usr/local/opt/llvm/bin:$PATH"
