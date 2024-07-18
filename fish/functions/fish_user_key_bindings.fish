function fish_user_key_bindings
    bind \cp 'history-search-backward'
    bind \cn 'history-search-forward'

    bind \cf 'finder; commandline -f repaint'
    bind \e\cf 'finder $PWD; commandline -f repaint'
    bind \cq 'quick_fix; commandline -f repaint'

    fish_vi_key_bindings insert

    bind -M insert \cp 'history-search-backward'
    bind -M insert \cn 'history-search-forward'
    bind -M insert \cf 'finder; commandline -f repaint'
    bind -M insert \e\cf 'finder $PWD; commandline -f repaint'
    bind -M insert \cq 'quick_fix; commandline -f repaint'
end
