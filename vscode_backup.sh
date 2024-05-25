#!/bin/bash

# Define the backup directory
BACKUP_DIR="$HOME/vscode-backup-$(date +%Y%m%d-%H%M%S)"

# Create the backup directory
mkdir -p "$BACKUP_DIR"

# Copy settings and keybindings
cp "$HOME/.config/Code/User/settings.json" "$BACKUP_DIR/settings.json"
cp "$HOME/.config/Code/User/keybindings.json" "$BACKUP_DIR/keybindings.json"

# Copy snippets
cp -r "$HOME/.config/Code/User/snippets" "$BACKUP_DIR/snippets"

# Copy themes
cp -r "$HOME/.config/Code/User/workspaceStorage" "$BACKUP_DIR/workspaceStorage"

# List installed extensions
code --list-extensions > "$BACKUP_DIR/extensions.txt"

echo "VS Code backup completed. Files are saved in $BACKUP_DIR."
