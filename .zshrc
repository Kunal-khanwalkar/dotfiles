# Oh-my-zsh settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"
plugins=(zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# My Personal settings
shuf -n 1 ~/prompts.txt
alias my_folder="/media/kunal/New\ Volume/My_Folder"
alias stuff="/media/kunal/New\ Volume/My_Folder/stuff"
alias ls="exa --icons -a -l --group-directories-first"
alias sl="exa --icons -a -l --group-directories-first" #fat fingers
alias tmux="tmux -u"
alias emacs="emacsclient -c -a 'emacs' -F '((fullscreen . maximized))' -e '(progn (raise-frame) (x-focus-frame (selected-frame)))'"

bindkey -v

export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

