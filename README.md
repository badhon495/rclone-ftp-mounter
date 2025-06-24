<div align="center">

# RClone FTP Mounter

![Shell Script](https://img.shields.io/badge/Shell-Script-4EAA25?style=flat-square&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-Compatible-FCC624?style=flat-square&logo=linux&logoColor=black)

**A simple and efficient script to mount FTP servers locally using RClone and FUSE**

*Access your favorite FTP content directly through your file manager*

</div>


## Overview

RClone FTP Mounter is a bash script that allows you to mount multiple FTP servers locally on your Linux system using RClone and FUSE. The script comes pre-configured with popular BDIX FTP servers including CircleFTP and DhakaFlix, but can be easily customized to include any FTP server.

### Features

- **Automated Setup**: One-command installation and configuration
- **Multiple FTP Sources**: Pre-configured with 35+ FTP endpoints
- **Union Mount**: All FTP servers accessible through a single mount point
- **Performance Optimized**: Uses VFS cache for better performance
- **User-Friendly**: Automatic user group management and permissions
- **Easy Remounting**: Simple commands for reconnection

### Pre-configured FTP Servers

#### DhakaFlix Servers
- **12 DhakaFlix endpoints** for diverse content access

#### CircleFTP Servers
- **16 CircleFTP endpoints** for diverse content access


## Quick Start

### Method 1: Direct Installation (Recommended)

Run the following command to install and configure everything automatically:

```bash
curl -fsSL https://raw.githubusercontent.com/badhon495/rclone-ftp-mounter/refs/heads/main/Install.sh | bash
```

### Method 2: Manual Installation

1. **Download the script:**
   ```bash
   wget https://raw.githubusercontent.com/badhon495/rclone-ftp-mounter/refs/heads/main/Install.sh
   ```

2. **Make it executable:**
   ```bash
   chmod +x Install.sh
   ```

3. **Run the script:**
   ```bash
   ./Install.sh
   ```


## Prerequisites

- **Linux-based system** (Ubuntu, Debian, Mint, etc.)
- **Internet connection** (preferably BDIX for optimal performance)
- **sudo privileges** for package installation


## What the Script Does

1. **Updates system packages** and installs required dependencies:
   - `rclone` - Cloud storage management tool
   - `fuse3` - Filesystem in userspace

2. **Configures system settings**:
   - Loads FUSE kernel module
   - Adds user to the `fuse` group for proper permissions

3. **Sets up RClone configuration**:
   - Creates configuration file at `~/.config/rclone/rclone.conf`
   - Configures 35+ FTP endpoints
   - Creates a union mount combining all servers

4. **Mounts the filesystem**:
   - Creates mount directory at `~/MyMediaDrive`
   - Mounts all FTP servers with VFS caching enabled


## Usage

After installation, your FTP content will be accessible at:
```
~/MyMediaDrive/
```

### Remounting

If you need to remount the drive (after reboot or disconnection):

```bash
rclone mount MyMediaDrive: ~/MyMediaDrive --vfs-cache-mode full &
```

### Unmounting

To unmount the drive:

```bash
fusermount -u ~/MyMediaDrive
```


## Customization

### Adding Your Own FTP Server

To add a custom FTP server, edit the RClone configuration file:

```bash
nano ~/.config/rclone/rclone.conf
```

Add your server configuration:

```ini
[YourFTPName]
type = http
url = http://your-ftp-server.com/path/
```

Then add your server name to the `MyMediaDrive` union remotes list:

```ini
[MyMediaDrive]
type = union
remotes = DhakaFlix12: ... YourFTPName:
```

### Changing Mount Location

To change the default mount location, modify the `MOUNT_FOLDER` variable in the script:

```bash
MOUNT_FOLDER="$HOME/YourCustomPath"
```


## Important Notes

- **BDIX Access Required**: You must be connected to a Bangladeshi ISP for BDIX FTP access
- **Persistent Connection**: Keep your internet connection stable for uninterrupted access
- **Cache Usage**: VFS cache may use disk space; monitor available storage
- **Permissions**: Owner of this script does not host any of the FTP servers. You are responsible for ensuring you have permission to access and use the FTP servers listed in the configuration.


## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Setup

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---


<div align="center">
  <p>⭐ Star this repo if you found it helpful!</p>
</div>