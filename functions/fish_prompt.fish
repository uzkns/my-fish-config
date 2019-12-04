function fish_prompt --description 'Write out the prompt'
	
    set stat $status

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_color_blue
        set -g __fish_color_blue (set_color -o blue)
    end

    if not set -q __git_cb
        set __git_cb (set_color normal)" (:"(set_color brown)(git branch ^/dev/null | grep \* | sed 's/* //')(set_color normal)")"
    end

      # get the current dir nicely ... replace $HOME with "~"
    set -l realhome ~
    set -l __dir (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)

    #Set the color for the status depending on the value
    set __fish_color_status (set_color -o green)
    if test $stat -gt 0
        set __fish_color_status (set_color -o red)
    end

    switch "$USER"

        case root toor

            if not set -q __fish_prompt_cwd
                if set -q fish_color_cwd_root
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
                else
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
                end
            end

            printf '%s@%s %s%s%s# ' $USER (prompt_hostname) "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"

        case '*'

            if not set -q __fish_prompt_cwd
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end

            printf '[%s] %s%s%s %s(%s)%s \f\r∑ ' (date "+%H:%M:%S") "$__fish_prompt_cwd" "$__dir" "$__git_cb" "$__fish_color_status" "$stat" "$__fish_prompt_normal"

    end
end

#cool symbols: ⋈ ∑ 