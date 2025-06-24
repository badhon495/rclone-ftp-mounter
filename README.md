# rclone-ftp-mounter
This is a simple script to mount an FTP server on your file manager locally using rclone and fuse. In this script I have added CircleFTP and DhakaFLix FTP but you can add it your ISP's FTP server or any other FTP server you want to mount. Just 

`[FTP name]
type = http
url = Link to your FTP server`

then add the name of the remote at the bottom of all the links, you can also modify the mount if you want.

Use this command to to remount the rclone  'rclone mount MyMediaDrive: ~/MyMediaDrive --vfs-cache-mode full'

run the script by the followin command