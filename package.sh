#!/bin/bash

# =============================================================================
# TERMINAL SETUP PACKAGE SCRIPT
# =============================================================================
# This script creates a distributable package of the terminal setup
# =============================================================================

set -e

# Colors for output
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

print_header() {
    echo -e "${CYAN}═══════════════════════════════════════${NC}"
    echo -e "${CYAN}$1${NC}"
    echo -e "${CYAN}═══════════════════════════════════════${NC}"
}

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_NAME="terminal-setup-$(date +%Y%m%d)"
PACKAGE_DIR="/tmp/$PACKAGE_NAME"

print_header "📦 CREATING TERMINAL SETUP PACKAGE"
echo "Creating distributable package: $PACKAGE_NAME"
echo ""

# Clean up any existing package
if [[ -d "$PACKAGE_DIR" ]]; then
    print_status "Cleaning up existing package directory..."
    rm -rf "$PACKAGE_DIR"
fi

# Create package directory
print_status "Creating package directory..."
mkdir -p "$PACKAGE_DIR"

# Copy all files to package directory
print_status "Copying files to package..."
cp -r "$SCRIPT_DIR"/* "$PACKAGE_DIR/"

# Remove any temporary or unnecessary files
print_status "Cleaning up package..."
cd "$PACKAGE_DIR"
rm -f .DS_Store
rm -f Thumbs.db
rm -f *.tmp
rm -f *.log

# Create package archive
print_status "Creating package archive..."
cd /tmp
tar -czf "$PACKAGE_NAME.tar.gz" "$PACKAGE_NAME"

# Create zip package as well (if available)
if command -v zip >/dev/null 2>&1; then
    print_status "Creating zip package..."
    zip -r "$PACKAGE_NAME.zip" "$PACKAGE_NAME"
else
    print_warning "zip command not found, skipping zip package creation"
fi

# Move packages to home directory
print_status "Moving packages to home directory..."
mv "$PACKAGE_NAME.tar.gz" "$HOME/"

if [[ -f "$PACKAGE_NAME.zip" ]]; then
    mv "$PACKAGE_NAME.zip" "$HOME/"
fi

# Clean up temporary directory
rm -rf "$PACKAGE_DIR"

print_header "✅ PACKAGE CREATION COMPLETE"
echo ""
echo "Packages created successfully:"
echo "• $HOME/$PACKAGE_NAME.tar.gz"
if [[ -f "$HOME/$PACKAGE_NAME.zip" ]]; then
    echo "• $HOME/$PACKAGE_NAME.zip"
fi
echo ""
echo "Package contents:"
echo "• install.sh - Main installation script"
echo "• verify-setup.sh - Verification script"
echo "• uninstall.sh - Uninstall script"
echo "• README.md - Complete documentation"
echo "• configs/ - All configuration files"
echo "• scripts/ - Additional scripts"
echo "• fonts/ - Font files"
echo "• plugins/ - Plugin files"
echo ""
echo "To distribute:"
echo "1. Share the .tar.gz or .zip file"
echo "2. Recipients extract and run ./install.sh"
echo "3. Follow the README.md for instructions"
echo ""
echo "Package size:"
du -h "$HOME/$PACKAGE_NAME.tar.gz" "$HOME/$PACKAGE_NAME.zip" 2>/dev/null || echo "Unable to determine size"
