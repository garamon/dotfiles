alias vi nvim
alias vim nvim

set -U -x EDITOR nvim

set -x PATH /opt/homebrew/bin:/usr/local/bin $PATH
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $HOME/Library/Android/sdk/platform-tools $PATH

function fish_user_key_bindings
    bind \cr __fzf_reverse_isearch
    bind \cj fzf_z
    bind \cf __fzf_cd
    bind \cg __ghq_repository_search
end

starship init fish | source
