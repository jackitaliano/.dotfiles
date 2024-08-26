function fish_right_prompt
    set -l last_status $status
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)"⟨$last_status⟩"(set_color normal)

    else
        set stat (set_color green)'⟨✓⟩'
    end


    set_color brcyan
    echo -n (date "+%H:%M:%S")
    echo -n " $stat "
    set_color normal
end
