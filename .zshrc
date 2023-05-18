# Oh-my-zsh settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)
source $ZSH/oh-my-zsh.sh

# My Personal settings
echo "Once you have been living your best life for 3 - 4 months you will feel like this is who you have always been."
alias my_folder="/media/kunal/New\ Volume/My_Folder"
alias stuff="/media/kunal/New\ Volume/My_Folder/stuff"
alias ls="exa --icons -a -l --group-directories-first"
alias tmux="tmux -u"
alias emacs="emacsclient -c -a 'emacs' -F '((fullscreen . maximized))' -e '(progn (raise-frame) (x-focus-frame (selected-frame)))'"

set -o vi

export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

