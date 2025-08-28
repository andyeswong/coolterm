## ✨ Features

- **Oh My Zsh** with **Spaceship theme** for a beautiful and functional prompt
- **Custom terminal utilities** with cool functions and aliases
- **Enhanced plugins**: autosuggestions, syntax highlighting, completions
- **Nerd Fonts** for better icon support
- **Development tools**: Node.js, Python, Git with enhanced configurations
- **Custom aliases** for common development tasks
- **Cool functions** for system monitoring and file operations

## 📁 Package Contents

```
terminal-setup/
├── install.sh              # Main installation script
├── README.md              # This file
├── configs/               # Configuration files
│   ├── .zshrc            # Main zsh configuration
│   ├── spaceship.zsh     # Spaceship theme configuration
│   ├── cool-spaceship.zsh-theme  # Custom theme
│   └── terminal-utils.zsh # Custom terminal utilities
├── scripts/               # Additional scripts (if any)
├── fonts/                 # Font files (if any)
└── plugins/               # Plugin files (if any)
```

## 🚀 Quick Installation

### Prerequisites
- Ubuntu 18.04+ or similar Debian-based system
- Internet connection for downloading packages
- Sudo privileges

### Installation Steps

1. **Download and extract the package:**
   ```bash
   # If you have this as a zip file:
   unzip terminal-setup.zip
   cd terminal-setup
   
   # Or if you're copying from another system:
   cp -r /path/to/terminal-setup ~/
   cd ~/terminal-setup
   ```

2. **Make the install script executable:**
   ```bash
   chmod +x install.sh
   ```

3. **Run the installation script:**
   ```bash
   ./install.sh
   ```

4. **Restart your terminal or log out/in:**
   ```bash
   # The script will automatically set zsh as your default shell
   # You'll need to restart your terminal for changes to take effect
   ```

## 🎯 What Gets Installed

### Core Components
- **zsh** - Advanced shell
- **Oh My Zsh** - Framework for managing zsh configuration
- **Spaceship prompt** - Beautiful and informative prompt theme

### Essential Tools
- **Git** - Version control
- **Node.js & npm** - JavaScript runtime and package manager
- **Python3 & pip3** - Python runtime and package manager
- **htop** - Enhanced system monitor
- **cmatrix** - Matrix effect (fun!)
- **jq** - JSON processor

### Fonts
- **Powerline fonts** - For better prompt display
- **Nerd Fonts** - For icons and symbols

### Plugins
- **zsh-autosuggestions** - Fish-like autosuggestions
- **zsh-syntax-highlighting** - Command syntax highlighting
- **zsh-completions** - Additional completion definitions

## 🎨 Custom Features

### Cool Terminal Functions
- `sysinfo` - Display system information
- `diskusage` - Show disk usage in a cool way
- `netinfo` - Display network information
- `procinfo` - Show process information
- `resources` - Display system resources
- `gitcool` - Enhanced git status display
- `npminfo` - Node.js project information
- `mkcd` - Create and navigate to directory
- `backup` - Create timestamped backups
- `findfile` - Search for files with cool output
- `grepcool` - Search for text in files

### Enhanced Aliases
- **Navigation**: `..`, `...`, `dev`, `docs`, `dl`
- **Git shortcuts**: `gs`, `ga`, `gc`, `gp`, `gl`
- **System tools**: `ll`, `la`, `df`, `du`, `top`
- **Fun commands**: `matrix`, `starwars`, `weather`

### Development Helpers
- **Git integration** with status in prompt
- **Node.js version** display
- **Python version** display
- **Docker status** (if available)
- **Package information** display

## 🔧 Configuration Files

### Main Configuration
- **`~/.zshrc`** - Main zsh configuration with all plugins and aliases
- **`~/.config/spaceship.zsh`** - Spaceship theme customization

### Custom Additions
- **`~/.oh-my-zsh/custom/themes/cool-spaceship.zsh-theme`** - Enhanced theme
- **`~/.oh-my-zsh/custom/terminal-utils.zsh`** - Custom utilities

## 🎯 Post-Installation

After installation, you can:

1. **Customize your prompt** by editing `~/.config/spaceship.zsh`
2. **Add more aliases** to `~/.zshrc`
3. **Install additional plugins** in `~/.oh-my-zsh/custom/plugins/`
4. **Modify terminal utilities** in `~/.oh-my-zsh/custom/terminal-utils.zsh`

## 🆘 Troubleshooting

### Common Issues

1. **Fonts not displaying correctly:**
   ```bash
   # Refresh font cache
   fc-cache -fv
   # Restart terminal application
   ```

2. **Plugins not working:**
   ```bash
   # Check if plugins are properly installed
   ls ~/.oh-my-zsh/custom/plugins/
   # Restart terminal
   ```

3. **Spaceship theme not loading:**
   ```bash
   # Verify theme installation
   ls ~/.oh-my-zsh/custom/themes/spaceship-prompt/
   # Check .zshrc theme setting
   grep "ZSH_THEME" ~/.zshrc
   ```

### Getting Help

- Type `coolhelp` in your terminal to see all available functions
- Check the Oh My Zsh documentation: https://ohmyz.sh/
- Visit Spaceship prompt docs: https://spaceship-prompt.sh/

## 🔄 Updating

To update your terminal environment:

1. **Update Oh My Zsh:**
   ```bash
   omz update
   ```

2. **Update Spaceship prompt:**
   ```bash
   cd ~/.oh-my-zsh/custom/themes/spaceship-prompt
   git pull origin master
   ```

3. **Update plugins:**
   ```bash
   # For each plugin directory:
   cd ~/.oh-my-zsh/custom/plugins/plugin-name
   git pull origin master
   ```

## 📝 License

This setup package is provided as-is for personal use. Feel free to modify and distribute as needed.

## 🤝 Contributing

If you have improvements or find issues:
1. Fork the repository
2. Make your changes
3. Submit a pull request

---

**Enjoy your enhanced terminal experience! 🚀✨**
# coolterm
