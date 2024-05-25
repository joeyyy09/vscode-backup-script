#!/bin/bash

# Define the backup directory
BACKUP_DIR="$HOME/vscode-backup-$(date +%Y%m%d-%H%M%S)"

# Create the backup directory
mkdir -p "$BACKUP_DIR"

# Copy settings if they exist
if [ -f "$HOME/.config/Code/User/settings.json" ]; then
    cp "$HOME/.config/Code/User/settings.json" "$BACKUP_DIR/settings.json"
else
    echo "settings.json not found, skipping..."
fi

# Copy keybindings if they exist
if [ -f "$HOME/.config/Code/User/keybindings.json" ]; then
    cp "$HOME/.config/Code/User/keybindings.json" "$BACKUP_DIR/keybindings.json"
else
    echo "keybindings.json not found, skipping..."
fi

# Copy snippets if they exist
if [ -d "$HOME/.config/Code/User/snippets" ]; then
    cp -r "$HOME/.config/Code/User/snippets" "$BACKUP_DIR/snippets"
else
    echo "snippets directory not found, skipping..."
fi

# Copy themes if they exist
if [ -d "$HOME/.config/Code/User/workspaceStorage" ]; then
    cp -r "$HOME/.config/Code/User/workspaceStorage" "$BACKUP_DIR/workspaceStorage"
else
    echo "workspaceStorage directory not found, skipping..."
fi

# List installed extensions
code --list-extensions > "$BACKUP_DIR/extensions.txt"

echo "VS Code backup completed. Files are saved in $BACKUP_DIR."
