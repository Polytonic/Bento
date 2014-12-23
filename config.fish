# Define Paths
set HOMEBREW /usr/local/sbin
set -gx PATH $HOMEBREW $PATH
set -gx fish_greeting (set_color magenta)(date +"%A, %B %d, %Y at %r (%Z)")

# Git Prompt Configuration
set __fish_git_prompt_showdirtystate "yes"
set __fish_git_prompt_showstashstate "yes"
set __fish_git_prompt_showuntrackedfiles "yes"
set __fish_git_prompt_showupstream "yes"
set  __fish_git_prompt_showcolorhints "yes"

# need to set bold
set __fish_git_prompt_color cyan
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_prefix cyan
set __fish_git_prompt_color_suffix cyan
set __fish_git_prompt_color_stagedstate green
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Git Status Characters
set __fish_git_prompt_char_dirtystate "*"
set __fish_git_prompt_char_stagedstate "+"
set __fish_git_prompt_char_untrackedfiles "?"
set __fish_git_prompt_char_stashstate "\$"
set __fish_git_prompt_char_upstream_ahead "+"
set __fish_git_prompt_char_upstream_behind "-"
set __fish_git_prompt_char_stateseparator " ["

# Override Terminal Title and Set Prompt
function fish_title; echo $PWD | sed -e "s|^$HOME|~|" | tr -d "\n"; end
function fish_prompt

    set_color -o red;       echo -n (whoami)
    set_color    normal;    echo -n " at "
    set_color -o yellow;    echo -n (hostname -s)
    set_color    normal;    echo -n " in "
    set_color -o green;     echo -n (fish_title)
    set_color    normal;    echo -n " "
    if __fish_git_prompt > /dev/null
        printf "on%s\n" (__fish_git_prompt " %s]")
    end
    set_color    white;     echo -e "🍣  "

end
