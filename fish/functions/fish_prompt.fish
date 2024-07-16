function fish_prompt
    set -l last_status $status

    # PWD
    set_color brcyan 
    echo -n (prompt_pwd) ""

    set_color normal
    set __fish_git_prompt_describe_style branch
    set -q __fish_git_prompt_showdirtystate
    or set -g __fish_git_prompt_showdirtystate 1
    set -q __fish_git_prompt_showuntrackedfiles
    or set -g __fish_git_prompt_showuntrackedfiles 1
    set -q __fish_git_prompt_showcolorhints
    or set -g __fish_git_prompt_showcolorhints 1
    set -q __fish_git_prompt_color_untrackedfiles
    or set -g __fish_git_prompt_color_untrackedfiles yellow
    set -q __fish_git_prompt_char_untrackedfiles
    or set -g __fish_git_prompt_char_untrackedfiles '?'
    set -q __fish_git_prompt_color_invalidstate
    or set -g __fish_git_prompt_color_invalidstate red
    set -q __fish_git_prompt_char_invalidstate
    or set -g __fish_git_prompt_char_invalidstate '!'
    set -q __fish_git_prompt_color_dirtystate
    or set -g __fish_git_prompt_color_dirtystate blue
    set -q __fish_git_prompt_char_dirtystate
    or set -g __fish_git_prompt_char_dirtystate '*'
    set -q __fish_git_prompt_char_stagedstate
    or set -g __fish_git_prompt_char_stagedstate '✚'
    set -q __fish_git_prompt_color_cleanstate
    or set -g __fish_git_prompt_color_cleanstate green
    set -q __fish_git_prompt_char_cleanstate
    or set -g __fish_git_prompt_char_cleanstate '✓'
    set -q __fish_git_prompt_color_stagedstate
    or set -g __fish_git_prompt_color_stagedstate yellow
    set -q __fish_git_prompt_color_branch_dirty
    or set -g __fish_git_prompt_color_branch_dirty red
    set -q __fish_git_prompt_color_branch_staged
    or set -g __fish_git_prompt_color_branch_staged yellow
    set -q __fish_git_prompt_color_branch
    or set -g __fish_git_prompt_color_branch green
    set -g __fish_git_prompt_color_prefix blue
    set -g __fish_git_prompt_color_suffix blue

    set_color normal

    fish_vcs_prompt '⟨%s⟩ '

    set_color brgreen
    echo -n '➤ '
    set_color normal
end
