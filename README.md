## VS Code Backup Script 🪄 

This script automates the process of backing up your Visual Studio Code (VS Code) settings, making your developer life a breeze!  **Save yourself time and frustration** by ensuring your configurations are always protected. 

**Features:**

- ⚙️  **Backs up user settings and keybindings** for a seamless transition between devices.
-  **  Backs up installed extensions** so you don't have to hunt them down again.
- ✂️  **Backs up custom snippets** to keep your coding efficient.
-    **Backs up themes and workspace-related settings** to maintain your ideal coding environment.
-  ⏱️  **Generates a timestamped backup directory** for each backup, making it easy to identify specific versions.

**Requirements:**

- Tux  (Ubuntu operating system)
- Code!  (Visual Studio Code installed)
-  Bash shell

**Let's Backup! **

1. **Save the Script:**

   Create a new file named `vscode_backup.sh` and paste the following code:

   ```bash
   #!/bin/bash

   ### Define the backup directory with a fancy timestamp ️
   BACKUP_DIR="$HOME/vscode-backup-$(date +%Y%m%d-%H%M%S)"

   ### Create the backup directory, just in case it doesn't exist  
   mkdir -p "$BACKUP_DIR"

   ### Copy settings and keybindings  ⚙️  ⌨️
   cp "$HOME/.config/Code/User/settings.json" "$BACKUP_DIR/settings.json"
   cp "$HOME/.config/Code/User/keybindings.json" "$BACKUP_DIR/keybindings.json"

   ### Copy your snippets, for all those code shortcuts! ✂️
   cp -r "$HOME/.config/Code/User/snippets" "$BACKUP_DIR/snippets"

   ### Copy themes to keep your workspace looking sharp!  
   cp -r "$HOME/.config/Code/User/workspaceStorage" "$BACKUP_DIR/workspaceStorage"

   ### List installed extensions, ready for easy reinstallation  
   code --list-extensions > "$BACKUP_DIR/extensions.txt"

   echo "VS Code backup completed!  Files are saved in $BACKUP_DIR."

   ### Make the Script Executable:

   Open a terminal and run this command to give the script superpowers! ⚡

   ```bash
   chmod +x vscode_backup.sh
   ```

2. **Run the Script:**

   Execute the script with this command:

   ```bash
   ./vscode_backup.sh
   ```

   The script will create a timestamped directory in your home directory (e.g., ~/vscode-backup-20240525-110500) and copy all your VS Code configurations into it.

**Restoring Your Backup ⏪**

Need to restore your VS Code settings? No problem! 

**Settings and Keybindings:**

```bash
cp ~/vscode-backup-<timestamp>/settings.json ~/.config/Code/User/settings.json
cp ~/vscode-backup-<timestamp>/keybindings.json ~/.config/Code/User/keybindings.json
```

**Snippets:**

```bash
cp -r ~/vscode-backup-<timestamp>/snippets ~/.config/Code/User/snippets
```

**Themes and Workspace Settings:**

```bash
cp -r ~/vscode-backup-<timestamp>/workspaceStorage ~/.config/Code/User/workspaceStorage
```

**Reinstall Extensions:**

The script creates a list of your extensions in `extensions.txt`. Use it to reinstall them easily:

```bash
cat ~/vscode-backup-<timestamp>/extensions.txt | xargs -n 1 code --install-extension
```

This enhanced script keeps your VS Code configurations safe and sound, so you can code with confidence and peace of mind!  
