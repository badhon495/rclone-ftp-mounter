#!/bin/bash

set -e

echo "Installing RClone and FUSE..."
sudo apt update
sudo apt install -y rclone fuse3

echo "Loading FUSE module..."
sudo modprobe fuse

CONFIG_PATH="$HOME/.config/rclone/rclone.conf"
MOUNT_FOLDER="$HOME/MyMediaDrive"

echo "Creating mount folder at $MOUNT_FOLDER"
mkdir -p "$MOUNT_FOLDER"

echo "Writing RClone config to $CONFIG_PATH"

mkdir -p "$(dirname "$CONFIG_PATH")"

cat > "$CONFIG_PATH" <<EOF
[DhakaFlix12]
type = http
url = http://172.16.50.12/DHAKA-FLIX-12/TV-WEB-Series/

[DhakaFlix14-Animation]
type = http
url = http://172.16.50.14/DHAKA-FLIX-14/Animation%20Movies/

[DhakaFlix14-Animation-1080p]
type = http
url = http://172.16.50.14/DHAKA-FLIX-14/Animation%20Movies%20%281080p%29/

[DhakaFlix14-Hindi]
type = http
url = http://172.16.50.14/DHAKA-FLIX-14/Hindi%20Movies/

[DhakaFlix14-IMDb]
type = http
url = http://172.16.50.14/DHAKA-FLIX-14/IMDb%20Top-250%20Movies/

[DhakaFlix14-SouthHindiDubbed]
type = http
url = http://172.16.50.14/DHAKA-FLIX-14/SOUTH%20INDIAN%20MOVIES/Hindi%20Dubbed/

[DhakaFlix14-SouthOriginal]
type = http
url = http://172.16.50.14/DHAKA-FLIX-14/SOUTH%20INDIAN%20MOVIES/South%20Movies/

[DhakaFlix7-3D]
type = http
url = http://172.16.50.7/DHAKA-FLIX-7/3D%20Movies/

[DhakaFlix7-English]
type = http
url = http://172.16.50.7/DHAKA-FLIX-7/English%20Movies/

[DhakaFlix7-English-1080p]
type = http
url = http://172.16.50.7/DHAKA-FLIX-7/English%20Movies%20%281080p%29/

[DhakaFlix7-Foreign]
type = http
url = http://172.16.50.7/DHAKA-FLIX-7/Foreign%20Language%20Movies/

[DhakaFlix7-Kolkata]
type = http
url = http://172.16.50.7/DHAKA-FLIX-7/Kolkata%20Bangla%20Movies/

[DhakaFlix7-SatyajitRay]
type = http
url = http://172.16.50.7/DHAKA-FLIX-7/Kolkata%20Bangla%20Movies/Satyajit%20Ray%20Films/

[DhakaFlix9-AnimeCartoon]
type = http
url = http://172.16.50.9/DHAKA-FLIX-9/Anime%20%26%20Cartoon%20TV%20Series/

[DhakaFlix9-Awards]
type = http
url = http://172.16.50.9/DHAKA-FLIX-9/Awards%20%26%20TV%20Shows/

[DhakaFlix9-Documentary]
type = http
url = http://172.16.50.9/DHAKA-FLIX-9/Documentary/

[DhakaFlix9-Korean]
type = http
url = http://172.16.50.9/DHAKA-FLIX-9/KOREAN%20TV%20%26%20WEB%20Series/

[DhakaFlix9-Wrestling]
type = http
url = http://172.16.50.9/DHAKA-FLIX-9/WWE%20%26%20AEW%20Wrestling/

[CircleFTP1]
type = http
url = http://index.circleftp.net/FILE/

[CircleFTP2]
type = http
url = http://index2.circleftp.net/FILE/

[CircleFTP3]
type = http
url = http://index1.circleftp.net/FILE/

[CircleFTP4]
type = http
url = http://ftp3.circleftp.net/FILE/

[CircleFTP5]
type = http
url = http://ftp4.circleftp.net/FILE/

[CircleFTP6]
type = http
url = http://ftp5.circleftp.net/FILE/

[CircleFTP7]
type = http
url = http://ftp6.circleftp.net/FILE/

[CircleFTP8]
type = http
url = http://ftp7.circleftp.net/FILE/

[CircleFTP9]
type = http
url = http://ftp8.circleftp.net/FILE/

[CircleFTP10]
type = http
url = http://ftp9.circleftp.net/FILE/

[CircleFTP11]
type = http
url = http://ftp10.circleftp.net/FILE/

[CircleFTP12]
type = http
url = http://ftp11.circleftp.net/FILE/

[CircleFTP13]
type = http
url = http://ftp12.circleftp.net/FILE/

[CircleFTP14]
type = http
url = http://ftp13.circleftp.net/FILE/

[CircleFTP15]
type = http
url = http://ftp15.circleftp.net/FILE/

[CircleFTP16]
type = http
url = http://ftp17.circleftp.net/FILE/

[MyMediaDrive]
type = union
remotes = DhakaFlix12: DhakaFlix14-Animation: DhakaFlix14-Animation-1080p: DhakaFlix14-Hindi: DhakaFlix14-IMDb: DhakaFlix14-SouthHindiDubbed: DhakaFlix14-SouthOriginal: DhakaFlix7-3D: DhakaFlix7-English: DhakaFlix7-English-1080p: DhakaFlix7-Foreign: DhakaFlix7-Kolkata: DhakaFlix7-SatyajitRay: DhakaFlix9-AnimeCartoon: DhakaFlix9-Awards: DhakaFlix9-Documentary: DhakaFlix9-Korean: DhakaFlix9-Wrestling: CircleFTP1: CircleFTP2: CircleFTP3: CircleFTP4: CircleFTP5: CircleFTP6: CircleFTP7: CircleFTP8: CircleFTP9: CircleFTP10: CircleFTP11: CircleFTP12: CircleFTP13: CircleFTP14: CircleFTP15: CircleFTP16
EOF

# Color codes for better visibility
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m' # No Color

echo ""
echo -e "${GREEN}${BOLD}========================================${NC}"
echo -e "${GREEN}${BOLD}       SETUP COMPLETED SUCCESSFULLY!   ${NC}"
echo -e "${GREEN}${BOLD}========================================${NC}"
echo ""
echo -e "${BLUE}📁 Your media is accessible at: ${BOLD}$MOUNT_FOLDER${NC}"
echo ""
echo -e "${YELLOW}⚠️  IMPORTANT NOTES:${NC}"
echo -e "${YELLOW}   • You must stay connected to your ISP for BDIX access${NC}"
echo -e "${YELLOW}   • Use the command below every time to mount the FTP servers${NC}"
echo ""
echo -e "${BLUE}${BOLD}🚀 Mount Command:${NC}"
echo -e "${GREEN}rclone mount MyMediaDrive: ~/MyMediaDrive --vfs-cache-mode full${NC}"
echo ""
echo -e "${GREEN}${BOLD}========================================${NC}" 
