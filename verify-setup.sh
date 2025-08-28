#!/bin/bash

# =============================================================================
# TERMINAL SETUP VERIFICATION SCRIPT
# =============================================================================
# This script verifies that all components of the terminal setup
# have been installed correctly.
# =============================================================================

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_header() {
    echo -e "${CYAN}═══════════════════════════════════════${NC}"
    echo -e "${CYAN}$1${NC}"
    echo -e "${CYAN}═══════════════════════════════════════${NC}"
}

# Function to check if a command exists
check_command() {
    if command -v "$1" >/dev/null 2>&1; then
        print_status "$1 is installed"
        return 0
    else
        print_error "$1 is not installed"
        return 1
    fi
}

# Function to check if a directory exists
check_directory() {
    if [[ -d "$1" ]]; then
        print_status "$1 exists"
        return 0
    else
        print_error "$1 does not exist"
        return 1
    fi
}

# Function to check if a file exists
check_file() {
    if [[ -f "$1" ]]; then
        print_status "$1 exists"
        return 0
    else
        print_error "$1 does not exist"
        return 1
    fi
}

print_header "🔍 TERMINAL SETUP VERIFICATION"
echo "Checking all components of your terminal setup..."
echo ""

# Initialize counters
total_checks=0
passed_checks=0

# Check core shell
echo -e "${BLUE}Core Shell:${NC}"
((total_checks++))
if check_command "zsh"; then
    ((passed_checks++))
fi

# Check Oh My Zsh
echo -e "${BLUE}Oh My Zsh:${NC}"
((total_checks++))
if check_directory "$HOME/.oh-my-zsh"; then
    ((passed_checks++))
fi

# Check Spaceship prompt
echo -e "${BLUE}Spaceship Prompt:${NC}"
((total_checks++))
if check_directory "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt"; then
    ((passed_checks++))
fi

# Check custom theme
echo -e "${BLUE}Custom Theme:${NC}"
((total_checks++))
if check_file "$HOME/.oh-my-zsh/custom/themes/cool-spaceship.zsh-theme"; then
    ((passed_checks++))
fi

# Check terminal utilities
echo -e "${BLUE}Terminal Utilities:${NC}"
((total_checks++))
if check_file "$HOME/.oh-my-zsh/custom/terminal-utils.zsh"; then
    ((passed_checks++))
fi

# Check configuration files
echo -e "${BLUE}Configuration Files:${NC}"
((total_checks++))
if check_file "$HOME/.zshrc"; then
    ((passed_checks++))
fi

((total_checks++))
if check_file "$HOME/.config/spaceship.zsh"; then
    ((passed_checks++))
fi

# Check plugins
echo -e "${BLUE}Zsh Plugins:${NC}"
((total_checks++))
if check_directory "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"; then
    ((passed_checks++))
fi

((total_checks++))
if check_directory "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"; then
    ((passed_checks++))
fi

((total_checks++))
if check_directory "$HOME/.oh-my-zsh/custom/plugins/zsh-completions"; then
    ((passed_checks++))
fi

# Check essential tools
echo -e "${BLUE}Essential Tools:${NC}"
((total_checks++))
if check_command "git"; then
    ((passed_checks++))
fi

((total_checks++))
if check_command "node"; then
    ((passed_checks++))
fi

((total_checks++))
if check_command "npm"; then
    ((passed_checks++))
fi

((total_checks++))
if check_command "python3"; then
    ((passed_checks++))
fi

((total_checks++))
if check_command "htop"; then
    ((passed_checks++))
fi

((total_checks++))
if check_command "jq"; then
    ((passed_checks++))
fi

# Check NVM
echo -e "${BLUE}Node Version Manager:${NC}"
((total_checks++))
if check_directory "$HOME/.nvm"; then
    ((passed_checks++))
fi

# Check fonts
echo -e "${BLUE}Fonts:${NC}"
((total_checks++))
if fc-list | grep -i "nerd\|powerline" >/dev/null 2>&1; then
    print_status "Nerd Fonts and Powerline fonts are available"
    ((passed_checks++))
else
    print_warning "Nerd Fonts or Powerline fonts may not be properly installed"
fi

# Check shell default
echo -e "${BLUE}Shell Configuration:${NC}"
((total_checks++))
if [[ "$SHELL" == "/bin/zsh" ]]; then
    print_status "zsh is set as default shell"
    ((passed_checks++))
else
    print_warning "zsh is not set as default shell (current: $SHELL)"
fi

# Summary
echo ""
print_header "📊 VERIFICATION SUMMARY"
echo "Total checks: $total_checks"
echo "Passed: $passed_checks"
echo "Failed: $((total_checks - passed_checks))"
echo ""

if [[ $passed_checks -eq $total_checks ]]; then
    echo -e "${GREEN}🎉 All checks passed! Your terminal setup is complete.${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Restart your terminal application"
    echo "2. Try typing 'coolhelp' to see all available functions"
    echo "3. Enjoy your enhanced terminal experience! 🚀"
else
    echo -e "${YELLOW}⚠️  Some checks failed. Please review the errors above.${NC}"
    echo ""
    echo "Common solutions:"
    echo "1. Run the installation script again: ./install.sh"
    echo "2. Check if you have sudo privileges"
    echo "3. Ensure you have an internet connection"
    echo "4. Try logging out and back in"
fi

echo ""
echo "For help, check the README.md file or run 'coolhelp' in your terminal."
