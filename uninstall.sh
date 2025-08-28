#!/bin/bash

# =============================================================================
# TERMINAL SETUP UNINSTALL SCRIPT
# =============================================================================
# This script removes the terminal setup components
# Use with caution - this will remove your custom terminal configuration
# =============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

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

print_header "🗑️  TERMINAL SETUP UNINSTALLER"
echo "This script will remove the terminal setup components."
echo "This action cannot be undone!"
echo ""

read -p "Are you sure you want to continue? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Uninstall cancelled."
    exit 0
fi

echo ""
print_warning "Starting uninstall process..."

# Remove Oh My Zsh
if [[ -d "$HOME/.oh-my-zsh" ]]; then
    print_status "Removing Oh My Zsh..."
    rm -rf "$HOME/.oh-my-zsh"
fi

# Remove zsh configuration
if [[ -f "$HOME/.zshrc" ]]; then
    print_status "Removing .zshrc..."
    rm "$HOME/.zshrc"
fi

# Remove spaceship configuration
if [[ -f "$HOME/.config/spaceship.zsh" ]]; then
    print_status "Removing spaceship configuration..."
    rm "$HOME/.config/spaceship.zsh"
fi

# Remove NVM
if [[ -d "$HOME/.nvm" ]]; then
    print_status "Removing NVM..."
    rm -rf "$HOME/.nvm"
fi

# Remove custom fonts
if [[ -d "$HOME/.local/share/fonts" ]]; then
    print_status "Removing custom fonts..."
    rm -rf "$HOME/.local/share/fonts"
fi

# Reset shell to bash (if zsh was set as default)
if [[ "$SHELL" == "/bin/zsh" ]]; then
    print_status "Resetting default shell to bash..."
    chsh -s /bin/bash
    print_warning "You'll need to log out and back in for shell change to take effect"
fi

print_header "✅ UNINSTALL COMPLETE"
echo "Terminal setup has been removed."
echo ""
echo "Note: Some packages installed via apt may still be present."
echo "To remove them, run:"
echo "sudo apt remove zsh cmatrix jq fonts-powerline fonts-nerd-fonts"
echo ""
echo "You may need to log out and back in for all changes to take effect."
