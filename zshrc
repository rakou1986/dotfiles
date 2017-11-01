autoload -U compinit
compinit

PROMPT="%n@%M:%~$ "
#PROMPT="%n@%M:%39<...<%~$ "
# %n: ユーザー名
# %M: ホスト名（全部）
# %m: ホスト名（最初のドットまで）
# %/: カレントディレクトリ
# %~: カレントディレクトリ（短縮表示）
# %39<...< これ以降の文字列の最大長を39文字以下に前略表記する。省略を示す文字列を...とする。
PROMPT2="%_%% "

setopt correct
SPROMPT="did you mean... '%r' [n,y,a,e]: "

HISTFILE=~/.z-history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data 

#ls色設定
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# require: aptitude install command-not-found
source /etc/zsh_command_not_found

# 環境変数はこちら
export SVN_EDITOR=/usr/bin/vim

# コマンドを途中まで入力すると、それに一致する履歴を順番に検索。ipythonみたい。
# KとJで。
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^K" history-beginning-search-backward-end
bindkey "^J" history-beginning-search-forward-end
bindkey "^N" kill-line
bindkey "^L" accept-line
bindkey "^P" clear-screen

# ディレクトリのパスを打つだけでcd/pushdできる
setopt auto_cd
setopt auto_pushd

# 補完候補を詰めて表示
setopt list_packed

# 補完候補を表示するときなどにビープ音を鳴らさない
setopt nolistbeep

setopt multios

# # git-flowの補完
# source /home/nsm/git/git-flow-completion/git-flow-completion.zsh
# 
# # gitのブランチをプロンプトに表示
# autoload -Uz vcs_info
# zstyle ':vcs_info:*' formats '(%s)-[%b]'
# zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
# precmd () {
#     psvar=()
#     LANG=en_US.UTF-8 vcs_info
#     [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
# }
# RPROMPT="%1(v|%F{green}%1v%f|)"
# 
# source /home/nsm/.profile
