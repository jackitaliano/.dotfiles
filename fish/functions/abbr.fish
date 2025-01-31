# general
abbr -a so source ~/.config/fish/config.fish
abbr -a vi nvim
abbr -a cl clear

# tmux
abbr -a t tmux
abbr -a tn tmux new -t
abbr -a tl tmux ls
abbr -a ta tmux attach -s
abbr -a tk tmux kill-session
abbr -a tks tmux kill-server
abbr -a ts tmux-sessionizer

# git
abbr -a g git
abbr -a gs git status
abbr -a gd git diff
abbr -a gl git log --graph --decorate --all
abbr -a gd git diff
abbr -a gdl 'git diff "$(git rev-parse --short HEAD)^!"'
abbr -a gcm 'git commit -m "'
abbr -a gc git commit

abbr -a gcb git checkout
abbr -a gcnb git checkout -b
abbr -a gpnb git push -u origin
abbr -a gps git push
abbr -a gp git pull
abbr -a gaa git add --all
abbr -a gwa 'git worktree add "../link_$(pwd | cut -d"/" -f5-)"'
abbr -a gwa 'git worktree remove "../link_$(pwd | cut -d"/" -f5-)"'
abbr -a gwn 'cd "../link_$(pwd | cut -d"/" -f5-)" && nvim'

# other
abbr -a pb pbcopy
#abbr -a findh find ~ \\\( -path ~/Library -o -path ~/Desktop -o -path ~/.cups -o -path ~/.Trash \\\) -prune -o
abbr -a F finder
abbr -a f 'finder "$(pwd | cut -d"/" -f1-5)"'

# python
abbr -a menv 'python3 -m venv .venv'
abbr -a pipd 'pip install $DEFAULT_PIP_INSTALLS'
abbr -a pipr 'pip install -r requirements.txt'
abbr -a pt pytest
abbr -a ptc 'pytest --cov --cov-report=term-missing'
