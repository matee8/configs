if status is-interactive
    set -gx TERM "xterm-256color"
    set -gx PATH "/home/mate/.path:/home/mate/.cargo/bin:$PATH"
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx RUSTFLAGS "-W absolute_paths_not_starting_with_crate \
        -W deprecated_in_future \
        -W rust_2018_idioms \
        -W elided_lifetimes_in_paths \
        -W explicit_outlives_requirements \
        -W let_underscore_drop \
        -W meta_variable_misuse \
        -W missing_copy_implementations \
        -W missing_debug_implementations \
        -W missing_abi \
        -W ffi_unwind_calls \
        -W non_local_definitions \
        -W redundant_lifetimes \
        -W rust_2021_incompatible_closure_captures \
        -W rust_2021_incompatible_or_patterns \
        -W rust_2021_prefixes_incompatible_syntax \
        -W rust_2021_prelude_collisions \
        -W single_use_lifetimes \
        -W trivial_casts \
        -W trivial_numeric_casts \
        -W unit_bindings \
        -W unnameable_types \
        -W unused_extern_crates \
        -W unused_import_braces \
        -W unused_lifetimes \
        -W unused_qualifications \
        -W variant_size_differences \
        -W clippy::all \
        -W clippy::correctness \
        -W clippy::complexity \
        -W clippy::style \
        -W clippy::pedantic \
        -W clippy::nursery \
        -W clippy::suspicious \
        -W clippy::restriction \
        -W clippy::perf \
        -W clippy::cargo \
        -A clippy::blanket_clippy_restriction_lints \
        -A clippy::missing_docs_in_private_items \
        -A clippy::missing_errors_doc \
        -A clippy::multiple_crate_versions \
        -A clippy::pub_with_shorthand \
        -A clippy::self_named_module_files \
        -A clippy::implicit_return \
        -A clippy::question_mark_used \
        -A clippy::ref_patterns \
        -A clippy::separated_literal_suffix \
        -A clippy::arithmetic_side_effects \
        -A clippy::semicolon_outside_block \
        -A clippy::print_stderr \
        -A clippy::print_stdout \
        -A clippy::shadow_same"
    alias clear="clear && fastfetch"
    alias startx="startx && clear"
    alias ls="exa"
    # alias find="fd"
    # alias grep="ripgrep"
    alias learncppg++="g++ -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -ggdb -std=c++23"
    clear
    starship init fish | source
    zoxide init --cmd cd fish | source
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
