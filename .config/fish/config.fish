if status is-interactive
  alias shortcuts="grep -E '^(alias|abbr)' ~/.config/fish/conf.d/abbr.fish | grep -v '========='"

  fish_add_path $HOME/.local/bin

  # Commands to run in interactive sessions can go here
  starship init fish | source
end
