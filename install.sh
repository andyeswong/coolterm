#!/bin/bash

# =============================================================================
# TERMINAL SETUP INSTALLATION SCRIPT
# =============================================================================
# This script replicates the complete terminal environment with:
# - Oh My Zsh + Spaceship theme
# - Custom plugins and configurations
# - Enhanced terminal utilities
# - Required fonts and dependencies
# =============================================================================

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${CYAN}═══════════════════════════════════════${NC}"
    echo -e "${CYAN}$1${NC}"
    echo -e "${CYAN}═══════════════════════════════════════${NC}"
}

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    print_error "This script should not be run as root!"
    exit 1
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

print_header "🚀 TERMINAL ENVIRONMENT SETUP"
echo "This script will set up your complete terminal environment"
echo "including Oh My Zsh, Spaceship theme, and custom utilities."
echo ""

# Update system packages
print_status "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install required packages
print_status "Installing required packages..."
sudo apt install -y \
    zsh \
    curl \
    wget \
    git \
    htop \
    cmatrix \
    jq \
    python3 \
    python3-pip \
    nodejs \
    npm \
    fonts-powerline \
    unzip \
    build-essential


# Try to install Nerd Fonts, but don't fail if not available
print_status "Installing Nerd Fonts..."
if apt-cache search fonts-nerd-fonts | grep -q fonts-nerd-fonts; then
    sudo apt install -y fonts-nerd-fonts
    print_status "✓ Nerd Fonts installed via package manager"
else
    print_warning "fonts-nerd-fonts package not available, will install manually"
fi
# Install Oh My Zsh
print_status "Installing Oh My Zsh..."
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    print_warning "Oh My Zsh already installed, skipping..."
fi

# Install Spaceship prompt
print_status "Installing Spaceship prompt..."
if [[ ! -d "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" ]]; then
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" --depth=1
    ln -sf "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
else
    print_warning "Spaceship prompt already installed, skipping..."
fi

# Install zsh plugins
print_status "Installing zsh plugins..."

# zsh-autosuggestions
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" --depth=1
else
    print_warning "zsh-autosuggestions already installed, skipping..."
fi

# zsh-syntax-highlighting
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" --depth=1
else
    print_warning "zsh-syntax-highlighting already installed, skipping..."
fi

# zsh-completions
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
    git clone https://github.com/zsh-users/zsh-completions "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" --depth=1
else
    print_warning "zsh-completions already installed, skipping..."
fi

# Install NVM (Node Version Manager)
print_status "Installing NVM..."
if [[ ! -d "$HOME/.nvm" ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
else
    print_warning "NVM already installed, skipping..."
fi

# Copy configuration files
print_status "Setting up configuration files..."

# Create necessary directories
mkdir -p "$HOME/.oh-my-zsh/custom/themes"
mkdir -p "$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$HOME/.config"

# Copy .zshrc
if [[ -f "$SCRIPT_DIR/configs/.zshrc" ]]; then
    cp "$SCRIPT_DIR/configs/.zshrc" "$HOME/.zshrc"
    print_status "✓ .zshrc configured"
else
    print_error "Could not find .zshrc in configs directory!"
fi

# Copy spaceship configuration
if [[ -f "$SCRIPT_DIR/configs/spaceship.zsh" ]]; then
    cp "$SCRIPT_DIR/configs/spaceship.zsh" "$HOME/.config/spaceship.zsh"
    print_status "✓ Spaceship configuration set up"
else
    print_error "Could not find spaceship.zsh in configs directory!"
fi

# Copy custom theme
if [[ -f "$SCRIPT_DIR/configs/cool-spaceship.zsh-theme" ]]; then
    cp "$SCRIPT_DIR/configs/cool-spaceship.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/"
    print_status "✓ Custom theme installed"
else
    print_error "Could not find cool-spaceship.zsh-theme in configs directory!"
fi

# Copy terminal utilities
if [[ -f "$SCRIPT_DIR/configs/terminal-utils.zsh" ]]; then
    cp "$SCRIPT_DIR/configs/terminal-utils.zsh" "$HOME/.oh-my-zsh/custom/"
    print_status "✓ Terminal utilities installed"
else
    print_error "Could not find terminal-utils.zsh in configs directory!"
fi

# Install additional fonts
print_status "Installing additional fonts..."
mkdir -p "$HOME/.local/share/fonts"

# Download and install Nerd Fonts
if [[ ! -f "$HOME/.local/share/fonts/Hack Regular Nerd Font Complete.ttf" ]]; then
    print_status "Downloading and installing Nerd Fonts..."
    cd /tmp
    
    # Try to download Nerd Fonts
    if wget -q --spider https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip; then
        wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
        if [[ -f "Hack.zip" ]]; then
            unzip -q Hack.zip -d "$HOME/.local/share/fonts/"
            rm Hack.zip
            fc-cache -fv
            print_status "✓ Nerd Fonts installed successfully"
        else
            print_warning "Failed to download Nerd Fonts, continuing without them"
        fi
    else
        print_warning "Unable to reach Nerd Fonts repository, continuing without them"
    fi
else
    print_warning "Nerd Fonts already installed, skipping..."
fi

# Install alternative fonts if Nerd Fonts failed
if [[ ! -f "$HOME/.local/share/fonts/Hack Regular Nerd Font Complete.ttf" ]]; then
    print_status "Installing alternative fonts..."
    sudo apt install -y fonts-hack-ttf fonts-noto-color-emoji
    print_status "✓ Alternative fonts installed"
fi
# Set zsh as default shell
print_status "Setting zsh as default shell..."
if [[ "$SHELL" != "/bin/zsh" ]]; then
    chsh -s /bin/zsh
    print_status "✓ zsh set as default shell (requires logout/login)"
else
    print_warning "zsh is already the default shell"
fi

# Install additional tools
print_status "Installing additional development tools..."

# Install global npm packages
if command -v npm >/dev/null 2>&1; then
    npm install -g yarn typescript ts-node nodemon
    print_status "✓ Global npm packages installed"
fi

# Install Python packages
if command -v pip3 >/dev/null 2>&1; then
    pip3 install --user requests beautifulsoup4 pandas numpy
    print_status "✓ Python packages installed"
fi

# Create useful aliases and functions
print_status "Setting up additional aliases..."

# Create a backup of current .zshrc if it exists
if [[ -f "$HOME/.zshrc.backup" ]]; then
    rm "$HOME/.zshrc.backup"
fi
if [[ -f "$HOME/.zshrc" ]]; then
    cp "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

print_header "🎉 INSTALLATION COMPLETE!"
echo ""
echo "Your terminal environment has been set up successfully!"
echo ""
echo "Next steps:"
echo "1. Log out and log back in (or restart your terminal)"
echo "2. Your new zsh environment will be loaded automatically"
echo "3. Try typing 'coolhelp' to see all available functions"
echo "4. Customize your terminal further if needed"
echo ""
echo "Features installed:"
echo "✓ Oh My Zsh with Spaceship theme"
echo "✓ Custom terminal utilities and functions"
echo "✓ Enhanced plugins (autosuggestions, syntax highlighting, completions)"
echo "✓ Nerd Fonts for better icon support"
echo "✓ Development tools (Node.js, Python, Git)"
echo "✓ Custom aliases and functions"
echo ""
echo "Configuration files:"
echo "• ~/.zshrc - Main zsh configuration"
echo "• ~/.config/spaceship.zsh - Spaceship theme configuration"
echo "• ~/.oh-my-zsh/custom/ - Custom themes and plugins"
echo ""
echo "Enjoy your enhanced terminal! 🚀"
echo ""

# Make the script executable
chmod +x "$SCRIPT_DIR/install.sh"

print_status "Installation script completed successfully!"
