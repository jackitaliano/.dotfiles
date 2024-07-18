function fish_user_key_bindings
    bind \cp 'history-search-backward'
    bind \cn 'history-search-forward'

    bind \cf 'finder; commandline -f repaint'

    fish_vi_key_bindings insert

    bind -M insert \cp 'history-search-backward'
    bind -M insert \cn 'history-search-forward'
    bind -M insert \cf 'finder; commandline -f repaint'
end
