append_path '/usr/lib/rustup/bin'
append_path "$XDG_DATA_HOME"/cargo/bin
export PATH

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
