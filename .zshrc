# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
#source ~/.bash_profile
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


LS_COLORS=$LS_COLORS:'di=1;33:' ; export LS_COLORS


alias expanse='ssh dbuhl@login.expanse.sdsc.edu -Y'
alias hb='ssh dbuhl@hb.ucsc.edu'
alias grape='ssh -o HostKeyAlgoritm="ssh-rsa"  dbuhl@grape.soe.ucsc.edu'

alias dlwd='cd ~/Downloads'
alias zconf='vim ~/.zshrc'
alias vconf='vim ~/.vimrc'
alias vcolors='cd ~/.vim/plugged/onedark.vim/colors'
alias nconf='vim ~/.config/neofetch/config.conf'
alias tconf='vim ~/.tmux.conf'
alias rzsh='source ~/.zshrc'
alias rtmux='tmux source ~/.tmux.conf'
alias rconda='source ~/miniconda3/bin/activate'
alias deda="conda activate dedalus3"
alias pyfold='cd ~/Desktop/"Research Fall 2023"/"Python Code"'
alias ffold='cd ~/Desktop/"Research Fall 2023"/"Fortran Code"'
alias mfold='cd ~/Desktop/"Research Fall 2023"/"Matlab Code"'
alias am250fold='cd ~/Desktop/"AM 250 Stuff"'
alias matlab='cd /usr/local/MATLAB/R2023b/bin; ./matlab'

PROMPT='%B%F{white}[𝚫 %F{33}D%F{220}B %F{white}%1~] ∝ %F{158}' 

tmux

echo -e '\n\n'

neofetch

echo -e '\t\033[1;96mAliases\t\t\t\033[1;93mDescription\n\t\033[1;97m-------\t\t\t-----------'
echo -e '\t\033[0;96mzconf\t\t\t\033[0;93mZSH Config File'
echo -e '\t\033[0;96mvconf\t\t\t\033[0;93mVIM Config File'
echo -e '\t\033[0;96mtconf\t\t\t\033[0;93mTMUX Config File'
echo -e '\t\033[0;96mvcolors\t\t\t\033[0;93mVIM Theme Colors'
echo -e '\t\033[0;96mrzsh\t\t\t\033[0;93mReload ZSH'
echo -e '\t\033[0;96mrtmux\t\t\t\033[0;93mReload TMUX'
echo -e '\t\033[0;96mrconda\t\t\t\033[0;93mRun Conda'
echo -e '\t\033[0;96mdeda\t\t\t\033[0;93mActivate Dedalus Library'
echo -e '\t\033[0;96mpyfold\t\t\t\033[0;93mCD to Python Folder'
echo -e '\t\033[0;96mffold\t\t\t\033[0;93mCD to Fortran Folder'
echo -e '\t\033[0;96mmfold\t\t\t\033[0;93mCD to Matlab Folder'
echo -e '\t\033[0;96mam250fold\t\t\033[0;93mCD to AM 250 Folder'
echo -e '\t\033[0;96mdlwd\t\t\t\033[0;93mCD to Downloads Folder'
echo -e '\t\033[0;96mmatlab\t\t\t\033[0;93mOpen Matlab IDE'
echo -e '\n\t\033[1;96mLog Ons\t\t\t\033[1;93mMachine\n\t\033[1;97m-------\t\t\t-------'
echo -e '\t\033[0;96mexpanse\t\t\t\033[0;93mSDSC Expanse Computer'
echo -e '\t\033[0;96mhb\t\t\t\033[0;93mUCSC Hummingbird Computer'
echo -e '\t\033[0;96mgrape\t\t\t\033[0;93mUCSC Grape Computer'

echo -e '\n'
