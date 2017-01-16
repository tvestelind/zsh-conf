# Keep path entries unique
typeset -U path

path+=(/sbin)
path+=($HOME/bin)
path+=($HOME/.local/bin)
export PATH
