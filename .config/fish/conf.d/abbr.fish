# ==========================================
# ALIASES (Non-expanding - Stays short)
# Best for simple, everyday, non-destructive utilities
# ==========================================
# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cconf="cd ~/.config/"

# Standard Commands
alias c="clear"
alias clr="clear"
alias x="exit"
alias power="poweroff"

# List formats (using standard ls, but ready for eza/exa if you use them)
alias ls="ls --color=auto"
alias l="ls -al"
alias ll="ls -lha"

alias vi="nvim"
alias vim="nvim"

# Toggle Lenovo Conservation Mode
alias study="sudo tlp setcare 1 BAT0"   # Limit to 80% (Current state)
alias travel="sudo tlp setcare 0 BAT0"  # Allow 100% charge
alias bstat="sudo tlp-stat -b"          # Quick battery health check

# ==========================================
# ABBREVIATIONS (Expanding - Shows full command)
# Best for package managers, Git, and complex tools
# ==========================================

# Arch Linux (Pacman & Yay)
abbr -a sp "sudo pacman"
abbr -a pa "pacman"
abbr -a yup "yay -Syu"           # Full system update
abbr -a yin "yay -S"             # Install package
abbr -a yrm "yay -Rns"           # Clean uninstall (removes package + dependencies)
abbr -a yorph "yay -Yc"          # Clean up orphaned packages

# Git (Expands so you can easily append branch names or messages)
abbr -a g "git "
abbr -a gs "git status -sb"      # Clean, short status
abbr -a ga "git add ."
abbr -a gb "git branch"
abbr -a gf "git fetch"
abbr -a gc "git commit -m"       # Ready to type your message
abbr -a gca "git commit --amend --no-edit" # Quick fix for forgotten files
abbr -a gsw "git switch"         # Modern git checkout
abbr -a gp "git push"
abbr -a gl "git pull"
abbr -a glog "git log --oneline --graph --decorate --all" # Visual git tree

# Tmux
abbr -a t "tmux"
abbr -a tn "tmux new -s"         # Create a named session (e.g., tn dev)
abbr -a ta "tmux attach -t"      # Attach to a specific session
abbr -a tl "tmux ls"
abbr -a tk "tmux kill-server"

# Python & Project Workflow
abbr -a py "python"
abbr -a venv "source .venv/bin/activate.fish"
abbr -a mkvenv "python -m venv .venv"

# Custom Scripts
abbr -a setup "fd_up setup.sh | xargs bash"
