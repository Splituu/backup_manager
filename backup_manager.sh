#!/bin/bash

#Backup Manager
#It is simple backup manager which is responsible for creating backup files

BACKUP_DIR=~/Backups/
SOURCE_DIR=$1

if [ -z "$SOURCE_DIR" ]; then
	echo "Usage: $0 <directory_to_backup>"
	exit 1
elif [ ! -d "$SOURCE_DIR" ]; then
	echo "Directory doesn't exist"
	exit 1
else
	echo "Directory $SOURCE_DIR exists and we can do backup"
fi

mkdir -p "$BACKUP_DIR"
echo "Backup directory ensured at $BACKUP_DIR"

DATE=$(date +%Y-%m-%d_%H-%M-%S)
BASENAME=$(basename "$SOURCE_DIR")
BACKUP_FILE="$BACKUP_DIR${BASENAME}_$DATE.tar.gz"

tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$BASENAME"
TAR_EXIT_CODE=$?

if [ $TAR_EXIT_CODE -eq 0 ]; then
	echo "Backup successfully created!"
else
	echo "Backup failed!"
	exit 1
fi

find "$BACKUP_DIR" -type f -name "${BASENAME}_*.tar.gz" -mtime +7 -exec rm {} \;
echo "Old backups (older than 7 days) deleted"
