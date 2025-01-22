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

abbr -a gcb git checkout
abbr -a gcnb git checkout -b
abbr -a gpnb git push -u origin
abbr -a gps git push
abbr -a gp git pull
abbr -a gaa git add .

# other
abbr -a pb pbcopy
#abbr -a findh find ~ \\\( -path ~/Library -o -path ~/Desktop -o -path ~/.cups -o -path ~/.Trash \\\) -prune -o
abbr -a F finder
abbr -a f 'finder "$(pwd | cut -d"/" -f1-5)"'

# python
abbr -a myenv 'python3 -m venv.venv'
abbr -a pipd 'pip install $DEFAULT_PIP_INSTALLS'
abbr -a pipr 'pip install -r requirements.txt'
abbr -a pt pytest
abbr -a ptc 'pytest --cov --cov-report=term-missing'
