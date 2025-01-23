function venv
    if test -n "$VIRTUAL_ENV"
        echo (set_color yellow) "already active:" (set_color normal) "~/$(echo "$VIRTUAL_ENV" | cut -d"/" -f4-)"
        return 1
    end

    set VENV_DIR $(find "$(pwd | cut -d"/" -f1-5)" -type d -name ".venv")
    if not test -n "$VENV_DIR"
        echo (set_color red) "no venv found" (set_color normal)
        return 1
    end

    if test (count ($VENV_DIR)) -gt 1
        for i in (seq (count $VENV_DIR))
            echo (set_color blue) "[$i]" (set_color normal) "~/$(echo "$VENV_DIR[$i]" | cut -d"/" -f4-)"
        end

        read -P "Select venv:" VENV_INDEX

        if test "$VENV_INDEX" -ge (count $VENV_DIR) || test "$VENV_INDEX" -lt 1
            echo (set_color red) "invalid selection" (set_color normal)
            return 1
        end

        set VENV_DIR "$VENV_DIR[$VENV_INDEX]"
    end

    if not test -n "$VENV_DIR"
        echo (set_color red) "no venv found" (set_color normal)
        return 1
    end

    set VENV_FILE "$VENV_DIR/bin/activate.fish"

    set VENV_FILE_SHORT "~/$(echo $VENV_FILE | cut -d"/" -f4-)"

    if not test -e "$VENV_FILE"
        echo (set_color red) "no venv activate at:" (set_color normal) "$VENV_FILE_SHORT"
        return 1
    end

    source $VENV_FILE

    set VENV_DIR_SHORT "~/$(echo $VENV_DIR | cut -d"/" -f4-)"

    echo (set_color green) "activated:" (set_color normal) "$VENV_DIR_SHORT"

end

function venv_silent
    if test -n "$VIRTUAL_ENV"
        return 1
    end

    set VENV_DIR $(find "$(pwd | cut -d"/" -f1-5)" -type d -name ".venv")
    if not test -n "$VENV_DIR"
        echo (set_color red) "no venv found" (set_color normal)
        return 1
    end

    if test (count ($VENV_DIR)) -gt 1
        return 1
    end

    if not test -n "$VENV_DIR"
        return 1
    end

    set VENV_FILE "$VENV_DIR/bin/activate.fish"

    if not test -e "$VENV_FILE"
        return 1
    end

    source $VENV_FILE

    set VENV_DIR_SHORT "~/$(echo $VENV_DIR | cut -d"/" -f4-)"

    echo (set_color green) "activated:" (set_color normal) "$VENV_DIR_SHORT"

end
