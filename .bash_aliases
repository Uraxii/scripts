# Alias managements
alias aliase='nvim ~/.bash_aliases; . ~/.bash_aliases' # alias[e]dit
alias aliasr='. ~/.bash_aliases' # alias[r]eload

# Applications
alias godot='godot-43' # Manual symlink in /bin
alias unity='unityhub --no-sandbox' # Kernal sandbox update broke unity hub

# Shorthands
alias pen='python3 -m venv' # [p]ython [e]vironment [n]ew
alias pes='source ./venv/bin/activate' # [p]ython [e]vironment [s]tart
alias ped='deactivate' # [p]ython [e]vironment [d]eactivate

# Active Projects
alias pf='cd <DIR>; nvim <DIR>/ & godot-43'
alias sm='cd <DIR>; source <DIR>; nvim <DIR>'
alias tt='cd <DIR>; nvim <DIR> & unityhub --no-sandbox'
