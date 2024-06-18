# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# setup pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

source $HOME/.venv/bin/activate

# pnpm
export PNPM_HOME="/Users/vn55z6z/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
export termzsh="$HOME/.zshrc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias today="icalBuddy -f -eep "notes" eventsToday"
alias tomorrow="icalBuddy -f -eep "notes" eventsFrom:tomorrow to:tomorrow"
alias wifi="${HOME}/wifi.sh ${@}"
alias paymo="${HOME}/paymo.swift add 25548372 today 32400 'tinyprocessing'"
alias glassformat="glass format path Plugins/AROptical"
alias glassxcode="scripts/xcodeproj_verifications/_cleanup_projects.py --all --throw"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Aliases
alias g='git'
compdef g=git
alias gs='git status'
compdef _git gs=git-status
alias gl='git pull'
compdef _git gl=git-pull
alias gup='git fetch && git rebase'
compdef _git gup=git-fetch
alias gp='git push'
compdef _git gp=git-push
gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff
alias gc='git commit -v'
compdef _git gc=git-commit
alias gca='git commit -v -a'
compdef _git gca=git-commit
alias gco='git checkout'
compdef _git gco=git-checkout
alias gcm='git checkout master'
alias gb='git branch'
compdef _git gb=git-branch
alias gba='git branch -a'
compdef _git gba=git-branch
alias gcount='git shortlog -sn'
compdef gcount=git
alias gcp='git cherry-pick'
compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=5'
compdef _git glg=git-log
alias glgg='git log --graph --max-count=5'
compdef _git glgg=git-log
alias gss='git status -s'
compdef _git gss=git-status
alias ga='git add'
compdef _git ga=git-add
alias gm='git merge'
compdef _git gm=git-merge
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias c="clear"
alias x="exit"
alias gd="git diff"
alias gf="git fetch"
alias l="ls -la"
alias lg="ls -la | grep"
alias glassformat="glass format path Plugins/AROptical"
alias glasspb="scripts/xcodeproj_verifications/_cleanup_projects.py --all --throw"
alias gfl="git fetch && git pull"
alias dmformat="swiftformat VisionSandbox/DigitalMeasurement/Sources  --config swiftformat"
alias visionformat="swiftformat VisionCenter/VisionCenter/Sources  --config swiftformat"
alias notifications="automator ~/notifications.workflow"
alias vpnup="${HOME}/vip.sh"
alias vpndown="/opt/cisco/secureclient/bin/vpn -s disconnect"
alias glassmergedevelopment="git merge --no-ff --no-commit development"
alias screenoff='osascript -e "tell application \"Finder\" to sleep"'
alias glassprs='gh pr list --search "is:open is:pr author:vn55z6z archived:false "'



source ~/tiny/zsh-autocomplete/zsh-autocomplete.plugin.zsh

fkill() {
    lsof -t -i tcp:$1 | xargs kill -9
}

fsearch() {
    find . -type f -iname "*$1*"
}

fgrep() {
    find . -type f -exec grep -i --color=auto -Hn "$1" {} +
}

export EDITOR=vim
export JIRA_URL=https://jira.walmart.com

alias jiralist="swifty-jira issue list"
alias jiralistdone="swifty-jira issue list --filter done"
alias jiralistall="swifty-jira issue list --filter all"
alias jirauser="swifty-jira user info"
alias jiraclean="swifty-jira clean"

jiradone()  {
    swifty-jira issue transition --key $1 --status done --resolution done
}

jirabacklog()  {
    swifty-jira issue transition --key $1 --status backlog
}

jiraworkinprogress() {
    swifty-jira issue transition --status "In Progress Dev" --resolution "In Progress Dev" --key $1
}

jirawork()  {
    swifty-jira issue transition --key $1 --status "Work in Progress"
}

jiraview()  {
    swifty-jira issue view --key $1 
}

jiracreateecom() {
    swifty-jira issue create --parent $1 --project MEMW --assignee vn55z6z --summary $2
}

jiracreatemem() {
    swifty-jira issue create --parent $1 --project MEM --assignee vn55z6z --summary $2
}

glassstartwork() {
    git switch development
    grhh
    gfl
    jirawork $1
    gb aroptical/vn55z6z/feature/$1
    git switch aroptical/vn55z6z/feature/$1
    git push -u origin aroptical/vn55z6z/feature/$1
}

alias gittree="git log --oneline --graph --decorate --branches"
alias tree="git log --graph --oneline --all"
alias vim="nvim"
alias news="hn top"
alias pkillxcode="pkill -9 XCBBuildService"

