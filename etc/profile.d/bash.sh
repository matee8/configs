_confdir=${XDG_CONFIG_HOME:-$HOME/.config}/bash
_datadir=${XDG_DATA_HOME:-$HOME/.local/share}/bash

if [ -d "$_confdir" ] && [ -f "$_confdir/profile" ]; then
    . "$_confdir/profile"
fi

[ ! -d "$_datadir" ] && mkdir -p "$_datadir"
HISTFILE="$_datadir/history"

unset _confdir
unset _datadir
