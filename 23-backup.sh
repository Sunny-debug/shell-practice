#!/bin/bash
set -euo pipefail

# -------- Colors (optional) --------
R="\e[31m"; G="\e[32m"; Y="\e[33m"; N="\e[0m"

# -------- Usage function --------
USAGE() {
  echo -e "${R}USAGE:${N} sudo bash $(basename "$0") <SOURCE_DIR> <DEST_DIR> [DAYS]"
  echo -e "Example: sudo bash $(basename "$0") /var/log /tmp 14"
  exit 1
}

# -------- Validate args BEFORE using $1/$2 (important with -u) --------
if [ $# -lt 2 ]; then
  USAGE
fi

SOURCE_DIR="$1"
DEST_DIR="$2"
DAYS="${3:-14}"

# -------- Must run as root (many logs are root-only) --------
USERID="$(id -u)"
if [ "$USERID" -ne 0 ]; then
  echo -e "${R}ERROR:${N} Please run as root (use sudo)."
  exit 1
fi

# -------- Validate directories exist --------
if [ ! -d "$SOURCE_DIR" ]; then
  echo -e "${R}ERROR:${N} Source directory '$SOURCE_DIR' does not exist."
  exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
  echo -e "${R}ERROR:${N} Destination directory '$DEST_DIR' does not exist."
  exit 1
fi

# -------- Logging setup --------
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME="$(basename "$0" .sh)"
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p "$LOGS_FOLDER"

# Log everything (stdout + stderr) into file AND console
exec > >(tee -a "$LOG_FILE") 2>&1

echo "------------------------------------------------------------"
echo "Script started at: $(date)"
echo "SOURCE_DIR: $SOURCE_DIR"
echo "DEST_DIR  : $DEST_DIR"
echo "DAYS      : $DAYS"
echo "LOG_FILE  : $LOG_FILE"
echo "------------------------------------------------------------"

# -------- Find .log files older than DAYS --------
# mapfile reads output lines safely into an array (handles spaces better than echo)
mapfile -t FILE_ARR < <(find "$SOURCE_DIR" -type f -name "*.log" -mtime +"$DAYS" 2>/dev/null)

if [ ${#FILE_ARR[@]} -eq 0 ]; then
  echo -e "${Y}No .log files older than $DAYS days found. Skipping zip.${N}"
  echo "Script completed at: $(date)"
  exit 0
fi

echo -e "${G}Found ${#FILE_ARR[@]} log files to archive.${N}"

# -------- Create zip --------
TIMESTAMP="$(date +%F-%H-%M-%S)"
ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
echo "Creating zip: $ZIP_FILE_NAME"

# Feed the list to zip via stdin, zip reads one path per line with -@
printf '%s\n' "${FILE_ARR[@]}" | zip -@ -j "$ZIP_FILE_NAME"

echo -e "${G}Archive created successfully:${N} $ZIP_FILE_NAME"
echo "Script completed at: $(date)"