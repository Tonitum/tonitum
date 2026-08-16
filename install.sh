#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ]; then
        if [ "$(readlink "$dest")" = "$src" ]; then
            echo "OK   $dest"
            return
        fi
        rm "$dest"
    elif [ -e "$dest" ]; then
        echo "BACKUP $dest -> ${dest}.bak"
        mv "$dest" "${dest}.bak"
    fi

    mkdir -p "$(dirname "$dest")"
    ln -s "$src" "$dest"
    echo "LINK $src -> $dest"
}

for tool_dir in "$repo_dir"/config/*/; do
    tool="$(basename "$tool_dir")"
    case "$tool" in
        bash|vim|tmux|terminal) continue ;;
    esac
    link "$repo_dir/config/$tool" "$HOME/.config/$tool"
done

link "$repo_dir/config/bash/.bashrc" "$HOME/.bashrc"
link "$repo_dir/config/bash/.bash_aliases" "$HOME/.bash_aliases"
link "$repo_dir/config/vim/.vimrc" "$HOME/.vimrc"
link "$repo_dir/config/vim/.vim" "$HOME/.vim"
link "$repo_dir/config/tmux/.tmux.conf" "$HOME/.tmux.conf"

for script in "$repo_dir"/config/tmux/tmux-sessionizer "$repo_dir"/config/tmux/worktrees "$repo_dir"/scripts/bash/*; do
    link "$script" "$HOME/.local/bin/$(basename "$script")"
done

echo
echo "Done. Install tmux plugins with prefix + I in a tmux session."
