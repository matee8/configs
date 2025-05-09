append_path '/usr/lib/rustup/bin'

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

append_path "$CARGO_HOME"/bin

export PATH
