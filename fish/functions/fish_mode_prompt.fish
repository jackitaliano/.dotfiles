function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color --bold red
            echo '⟨N⟩'
        case insert 
            set_color --bold green
            echo '⟨I⟩'
        case visual
            set_color --bold magenta
            echo '⟨V⟩'
        case replace_one
            set_color --bold green
            echo '⟨R⟩'
        case '*'
            set_color --bold red
            echo '⟨?⟩'
    end
    set_color normal
    echo ' '
end

