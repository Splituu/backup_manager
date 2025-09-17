# Backup Manager
A simple Bash script that creates backups of a directory and keeps your backups organized. Old backups (older than 7 days) are automatically deleted.

## Features
* Backup any directory to ~/Backups/
* Automatically adds a timestamp to backup files
* Keeps backups clean by removing files older than 7 days
* Easy to use and lightweight

Usage
```bash
# Run the script with the directory you want to backup
./backup_manager.sh /path/to/directory
```
/path/to/directory → the directory you want to backup

The backup file will be saved as:
```bash
~/Backups/<directory_name>_YYYY-MM-DD_HH-MM-SS.tar.gz
```

# Example
```bash
./backup_manager.sh ~/Documents/Projects
```
# Output:
```bash
Directory /home/user/Documents/Projects exists, we can do backup
Backup directory ensured at /home/user/Backups/
Backup successfully created!
Old backups (older than 7 days) deleted
```

# Backup file example:
```bash
~/Backups/Projects_2025-09-17_14-30-00.tar.gz
```

# How it works

* Check directory – The script ensures the directory exists before creating a backup.
* Create backup directory – Creates ~/Backups/ if it doesn’t exist.
* Generate timestamped backup – Uses tar to create a .tar.gz archive with the current date and time.
* Clean old backups – Deletes backup files older than 7 days automatically.

## Pro Tip

You can run the script without `./` by adding it to your `$PATH`:

```bash
# Create a bin directory in your home folder if it doesn't exist
mkdir -p ~/bin

# Move the script there
mv backup_manager.sh ~/bin/

# Make sure ~/bin is in your PATH (add this line to ~/.bashrc or ~/.zshrc)
export PATH="$HOME/bin:$PATH"

# Reload your shell configuration
source ~/.bashrc   # or source ~/.zshrc

# Now you can run the script from anywhere
backup_manager.sh /path/to/directory
```

Notes

* Make sure you have enough space in ~/Backups/
* Script works only for directories, not single files
* Tested on **Linux CentOS**
