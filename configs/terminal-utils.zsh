# =============================================================================
# COOL TERMINAL UTILITIES
# =============================================================================

# Color definitions
export COLOR_RESET="\033[0m"
export COLOR_BLACK="\033[0;30m"
export COLOR_RED="\033[0;31m"
export COLOR_GREEN="\033[0;32m"
export COLOR_YELLOW="\033[0;33m"
export COLOR_BLUE="\033[0;34m"
export COLOR_PURPLE="\033[0;35m"
export COLOR_CYAN="\033[0;36m"
export COLOR_WHITE="\033[0;37m"
export COLOR_BOLD_BLACK="\033[1;30m"
export COLOR_BOLD_RED="\033[1;31m"
export COLOR_BOLD_GREEN="\033[1;32m"
export COLOR_BOLD_YELLOW="\033[1;33m"
export COLOR_BOLD_BLUE="\033[1;34m"
export COLOR_BOLD_PURPLE="\033[1;35m"
export COLOR_BOLD_CYAN="\033[1;36m"
export COLOR_BOLD_WHITE="\033[1;37m"

# Cool functions
# =============================================================================

# PurpleMX branding function
purplemx_info() {
    echo "${COLOR_BOLD_PURPLE}═══════════════════════════════════════${COLOR_RESET}"
    echo "${COLOR_BOLD_PURPLE}💜 PurpleMX Development Environment${COLOR_RESET}"
    echo "${COLOR_BOLD_PURPLE}═══════════════════════════════════════${COLOR_RESET}"
    echo "${COLOR_CYAN}Version:${COLOR_RESET} 1.0.0"
    echo "${COLOR_CYAN}Theme:${COLOR_RESET} Spaceship + Custom"
    echo "${COLOR_CYAN}Features:${COLOR_RESET} Enhanced utilities, plugins, and functions"
    echo "${COLOR_BOLD_PURPLE}💜 PurpleMX${COLOR_RESET} - Your terminal, your way!"
    echo ""
}

# Show system info in a cool way
sysinfo() {
    echo "${COLOR_BOLD_CYAN}🖥️  System Information${COLOR_RESET}"
    echo "${COLOR_CYAN}═══════════════════════════════════════${COLOR_RESET}"
    echo "${COLOR_GREEN}OS:${COLOR_RESET} $(lsb_release -d | cut -f2)"
    echo "${COLOR_GREEN}Kernel:${COLOR_RESET} $(uname -r)"
    echo "${COLOR_GREEN}Architecture:${COLOR_RESET} $(uname -m)"
    echo "${COLOR_GREEN}Hostname:${COLOR_RESET} $(hostname)"
    echo "${COLOR_GREEN}Uptime:${COLOR_RESET} $(uptime -p)"
    echo "${COLOR_GREEN}Shell:${COLOR_RESET} $SHELL"
    echo "${COLOR_GREEN}Terminal:${COLOR_RESET} $TERM"
}

# Show disk usage in a cool way
diskusage() {
    echo "${COLOR_BOLD_YELLOW}💾 Disk Usage${COLOR_RESET}"
    echo "${COLOR_YELLOW}═══════════════════════════════════════${COLOR_RESET}"
    df -h | grep -E '^/dev/' | while read line; do
        local device=$(echo $line | awk '{print $1}')
        local size=$(echo $line | awk '{print $2}')
        local used=$(echo $line | awk '{print $3}')
        local avail=$(echo $line | awk '{print $4}')
        local use_percent=$(echo $line | awk '{print $5}')
        local mount=$(echo $line | awk '{print $6}')
        
        echo "${COLOR_CYAN}$device${COLOR_RESET} - ${COLOR_GREEN}Size: $size${COLOR_RESET}, ${COLOR_RED}Used: $used${COLOR_RESET}, ${COLOR_BLUE}Available: $avail${COLOR_RESET}"
        echo "  ${COLOR_YELLOW}Usage: $use_percent${COLOR_RESET} - ${COLOR_PURPLE}Mounted on: $mount${COLOR_RESET}"
        echo ""
    done
}

# Show network info in a cool way
netinfo() {
    echo "${COLOR_BOLD_BLUE}🌐 Network Information${COLOR_RESET}"
    echo "${COLOR_BLUE}═══════════════════════════════════════${COLOR_RESET}"
    
    # Local IP
    local local_ip=$(hostname -I | awk '{print $1}')
    echo "${COLOR_GREEN}Local IP:${COLOR_RESET} $local_ip"
    
    # Public IP
    local public_ip=$(curl -s https://ipinfo.io/ip 2>/dev/null || echo "Unable to fetch")
    echo "${COLOR_GREEN}Public IP:${COLOR_RESET} $public_ip"
    
    # Network interfaces
    echo "${COLOR_GREEN}Network Interfaces:${COLOR_RESET}"
    ip addr show | grep -E '^[0-9]+:' | while read line; do
        local interface=$(echo $line | awk '{print $2}' | sed 's/://')
        local state=$(ip link show $interface | grep -o 'state [A-Z]*' | cut -d' ' -f2)
        echo "  ${COLOR_CYAN}$interface${COLOR_RESET} - ${COLOR_YELLOW}State: $state${COLOR_RESET}"
    done
}

# Show process info in a cool way
procinfo() {
    echo "${COLOR_BOLD_PURPLE}⚙️  Process Information${COLOR_RESET}"
    echo "${COLOR_PURPLE}═══════════════════════════════════════${COLOR_RESET}"
    echo "${COLOR_GREEN}Top processes by CPU:${COLOR_RESET}"
    ps aux --sort=-%cpu | head -6 | while read line; do
        local user=$(echo $line | awk '{print $1}')
        local pid=$(echo $line | awk '{print $2}')
        local cpu=$(echo $line | awk '{print $3}')
        local mem=$(echo $line | awk '{print $4}')
        local command=$(echo $line | awk '{for(i=11;i<=NF;i++) printf $i" "; print ""}')
        
        if [[ $line != *"USER"* ]]; then
            echo "  ${COLOR_CYAN}PID: $pid${COLOR_RESET} - ${COLOR_RED}CPU: $cpu%${COLOR_RESET} - ${COLOR_BLUE}MEM: $mem%${COLOR_RESET}"
            echo "    ${COLOR_YELLOW}User: $user${COLOR_RESET} - ${COLOR_GREEN}Command: $command${COLOR_RESET}"
            echo ""
        fi
    done
}

# Cool directory navigation
# =============================================================================

# Quick navigation to common directories
alias dev='cd ~/Development 2>/dev/null || cd ~/dev 2>/dev/null || cd ~/projects 2>/dev/null || echo "No development directory found"'
alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias pics='cd ~/Pictures'
alias music='cd ~/Music'
alias videos='cd ~/Videos'

# Create and navigate to directory
mkcd() {
    mkdir -p "$1" && cd "$1"
    echo "${COLOR_GREEN}✅ Created and navigated to: $1${COLOR_RESET}"
}

# Quick backup function
backup() {
    if [[ -z "$1" ]]; then
        echo "${COLOR_RED}❌ Please specify a file or directory to backup${COLOR_RESET}"
        return 1
    fi
    
    local source="$1"
    local backup_name="${source}_$(date +%Y%m%d_%H%M%S).bak"
    
    if [[ -e "$source" ]]; then
        cp -r "$source" "$backup_name"
        echo "${COLOR_GREEN}✅ Backup created: $backup_name${COLOR_RESET}"
    else
        echo "${COLOR_RED}❌ Source not found: $source${COLOR_RESET}"
        return 1
    fi
}

# Cool search functions
# =============================================================================

# Search for files with cool output
findfile() {
    if [[ -z "$1" ]]; then
        echo "${COLOR_RED}❌ Please specify a filename to search for${COLOR_RESET}"
        return 1
    fi
    
    echo "${COLOR_BOLD_CYAN}🔍 Searching for: $1${COLOR_RESET}"
    echo "${COLOR_CYAN}═══════════════════════════════════════${COLOR_RESET}"
    
    find . -name "*$1*" -type f 2>/dev/null | while read file; do
        local size=$(du -h "$file" 2>/dev/null | cut -f1)
        local modified=$(stat -c %y "$file" 2>/dev/null | cut -d' ' -f1)
        echo "${COLOR_GREEN}📄 $file${COLOR_RESET}"
        echo "  ${COLOR_CYAN}Size: $size${COLOR_RESET} - ${COLOR_YELLOW}Modified: $modified${COLOR_RESET}"
        echo ""
    done
}

# Search for text in files
grepcool() {
    if [[ -z "$1" ]]; then
        echo "${COLOR_RED}❌ Please specify text to search for${COLOR_RESET}"
        return 1
    fi
    
    echo "${COLOR_BOLD_CYAN}🔍 Searching for text: $1${COLOR_RESET}"
    echo "${COLOR_CYAN}═══════════════════════════════════════${COLOR_RESET}"
    
    grep -r --color=always "$1" . 2>/dev/null | head -20
}

# Cool development helpers
# =============================================================================

# Show git status in a cool way
gitcool() {
    echo "${COLOR_BOLD_GREEN}📁 Git Status${COLOR_RESET}"
    echo "${COLOR_GREEN}═══════════════════════════════════════${COLOR_RESET}"
    
    if [[ -d ".git" ]]; then
        local branch=$(git branch --show-current 2>/dev/null)
        local git_status=$(git status --porcelain 2>/dev/null | wc -l)
        local ahead=$(git rev-list --count HEAD..origin/$branch 2>/dev/null || echo "0")
        local behind=$(git rev-list --count origin/$branch..HEAD 2>/dev/null || echo "0")
        
        echo "${COLOR_CYAN}Branch:${COLOR_RESET} $branch"
        echo "${COLOR_CYAN}Changes:${COLOR_RESET} $git_status files"
        echo "${COLOR_CYAN}Ahead:${COLOR_RESET} $ahead commits"
        echo "${COLOR_CYAN}Behind:${COLOR_RESET} $behind commits"
        
        if [[ $git_status -gt 0 ]]; then
            echo ""
            echo "${COLOR_YELLOW}Modified files:${COLOR_RESET}"
            git status --short 2>/dev/null | head -10
        fi
    else
        echo "${COLOR_RED}❌ Not a git repository${COLOR_RESET}"
    fi
}

# Show package.json info
npminfo() {
    if [[ -f "package.json" ]]; then
        echo "${COLOR_BOLD_GREEN}📦 Node.js Project Info${COLOR_RESET}"
        echo "${COLOR_GREEN}═══════════════════════════════════════${COLOR_RESET}"
        
        local name=$(jq -r '.name' package.json 2>/dev/null || echo "Unknown")
        local version=$(jq -r '.version' package.json 2>/dev/null || echo "Unknown")
        local description=$(jq -r '.description' package.json 2>/dev/null || echo "No description")
        local deps=$(jq '.dependencies | keys | length' package.json 2>/dev/null || echo "0")
        local dev_deps=$(jq '.devDependencies | keys | length' package.json 2>/dev/null || echo "0")
        
        echo "${COLOR_CYAN}Name:${COLOR_RESET} $name"
        echo "${COLOR_CYAN}Version:${COLOR_RESET} $version"
        echo "${COLOR_CYAN}Description:${COLOR_RESET} $description"
        echo "${COLOR_CYAN}Dependencies:${COLOR_RESET} $deps"
        echo "${COLOR_CYAN}Dev Dependencies:${COLOR_RESET} $dev_deps"
    else
        echo "${COLOR_RED}❌ No package.json found${COLOR_RESET}"
    fi
}

# Cool system monitoring
# =============================================================================

# Show system resources in a cool way
resources() {
    echo "${COLOR_BOLD_PURPLE}📊 System Resources${COLOR_RESET}"
    echo "${COLOR_PURPLE}═══════════════════════════════════════${COLOR_RESET}"
    
    # CPU
    local cpu_usage=$(top -n1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1 2>/dev/null || echo "Unable to get")
    echo "${COLOR_CYAN}CPU Usage:${COLOR_RESET} ${COLOR_RED}${cpu_usage}${COLOR_RESET}"
    
    # Memory
    local mem_info=$(free -h | grep Mem)
    local mem_total=$(echo $mem_info | awk '{print $2}')
    local mem_used=$(echo $mem_info | awk '{print $3}')
    local mem_free=$(echo $mem_info | awk '{print $4}')
    local mem_usage=$(echo $mem_info | awk '{print $3/$2 * 100.0}' | cut -d'.' -f1)
    
    echo "${COLOR_CYAN}Memory:${COLOR_RESET} ${COLOR_GREEN}Total: $mem_total${COLOR_RESET}, ${COLOR_RED}Used: $mem_used${COLOR_RESET}, ${COLOR_BLUE}Free: $mem_free${COLOR_RESET}"
    echo "${COLOR_CYAN}Memory Usage:${COLOR_RESET} ${COLOR_RED}${mem_usage}%${COLOR_RESET}"
    
    # Disk
    local disk_usage=$(df -h / | tail -1 | awk '{print $5}' | cut -d'%' -f1)
    echo "${COLOR_CYAN}Disk Usage (root):${COLOR_RESET} ${COLOR_RED}${disk_usage}%${COLOR_RESET}"
}

# Cool entertainment functions
# =============================================================================

# Matrix effect (if cmatrix is installed)
matrix_effect() {
    if command -v cmatrix >/dev/null 2>&1; then
        cmatrix -s
    else
        echo "${COLOR_RED}❌ cmatrix not installed. Install with: sudo apt install cmatrix${COLOR_RESET}"
    fi
}

# Star Wars ASCII art
starwars_art() {
    echo "${COLOR_BOLD_YELLOW}🌟 Star Wars ASCII Art${COLOR_RESET}"
    echo "${COLOR_YELLOW}═══════════════════════════════════════${COLOR_RESET}"
    echo "Try: telnet towel.blinkenlights.nl"
    echo "Or visit: https://asciinema.org/a/45"
}

# Show help for all cool functions
coolhelp() {
    echo "${COLOR_BOLD_CYAN}🚀 Cool Terminal Functions${COLOR_RESET}"
    echo "${COLOR_CYAN}═══════════════════════════════════════${COLOR_RESET}"
    echo ""
    echo "${COLOR_BOLD_PURPLE}PurpleMX Development Environment${COLOR_RESET}"
    echo "  ${COLOR_PURPLE}purplemx_info${COLOR_RESET} - Show PurpleMX branding and info"
    echo ""
    echo "${COLOR_BOLD_GREEN}System Information:${COLOR_RESET}"
    echo "  ${COLOR_GREEN}sysinfo${COLOR_RESET} - Show system information"
    echo "  ${COLOR_GREEN}diskusage${COLOR_RESET} - Show disk usage"
    echo "  ${COLOR_GREEN}netinfo${COLOR_RESET} - Show network information"
    echo "  ${COLOR_GREEN}procinfo${COLOR_RESET} - Show process information"
    echo "  ${COLOR_GREEN}resources${COLOR_RESET} - Show system resources"
    echo ""
    echo "${COLOR_BOLD_BLUE}File Operations:${COLOR_RESET}"
    echo "  ${COLOR_BLUE}mkcd <dir>${COLOR_RESET} - Create and navigate to directory"
    echo "  ${COLOR_BLUE}backup <file>${COLOR_RESET} - Create backup with timestamp"
    echo "  ${COLOR_BLUE}findfile <name>${COLOR_RESET} - Search for files"
    echo "  ${COLOR_BLUE}grepcool <text>${COLOR_RESET} - Search for text in files"
    echo ""
    echo "${COLOR_BOLD_YELLOW}Development:${COLOR_RESET}"
    echo "  ${COLOR_YELLOW}gitcool${COLOR_RESET} - Show git status in cool way"
    echo "  ${COLOR_YELLOW}npminfo${COLOR_RESET} - Show Node.js project info"
    echo ""
    echo "${COLOR_BOLD_PURPLE}Entertainment:${COLOR_RESET}"
    echo "  ${COLOR_PURPLE}matrix_effect${COLOR_RESET} - Matrix effect"
    echo "  ${COLOR_PURPLE}starwars_art${COLOR_RESET} - Star Wars ASCII art"
    echo ""
    echo "${COLOR_BOLD_CYAN}Navigation:${COLOR_RESET}"
    echo "  ${COLOR_CYAN}dev${COLOR_RESET} - Go to development directory"
    echo "  ${COLOR_CYAN}docs${COLOR_RESET} - Go to documents"
    echo "  ${COLOR_CYAN}dl${COLOR_RESET} - Go to downloads"
    echo ""
    echo "${COLOR_BOLD_WHITE}Use 'coolhelp' to show this help again${COLOR_RESET}"
}

# Initialize with welcome message
echo "${COLOR_BOLD_CYAN}🚀 Cool Terminal Utilities loaded!${COLOR_RESET}"
echo "${COLOR_CYAN}Type 'coolhelp' to see all available functions${COLOR_RESET}"

# Custom welcome message with system info
echo ""
echo "${COLOR_BOLD_PURPLE}═══════════════════════════════════════${COLOR_RESET}"
echo "${COLOR_BOLD_PURPLE}🎉 Welcome to your enhanced terminal! 🎉${COLOR_RESET}"
echo "${COLOR_BOLD_PURPLE}═══════════════════════════════════════${COLOR_RESET}"
echo ""

# Get system information
local username=$(whoami)
local hostname=$(hostname)
local local_ip=$(hostname -I | awk '{print $1}' 2>/dev/null || echo "Unknown")
local public_ip=$(curl -s --max-time 5 https://ipinfo.io/ip 2>/dev/null || echo "Unable to fetch")

echo "${COLOR_BOLD_CYAN}👤 User:${COLOR_RESET} ${COLOR_GREEN}$username${COLOR_RESET}"
echo "${COLOR_BOLD_CYAN}🖥️  Host:${COLOR_RESET} ${COLOR_GREEN}$hostname${COLOR_RESET}"
echo "${COLOR_BOLD_CYAN}🌐 Local IP:${COLOR_RESET} ${COLOR_GREEN}$local_ip${COLOR_RESET}"
echo "${COLOR_BOLD_CYAN}🌍 Public IP:${COLOR_RESET} ${COLOR_GREEN}$public_ip${COLOR_RESET}"
echo "${COLOR_BOLD_PURPLE}💜 PurpleMX${COLOR_RESET} - Your enhanced terminal experience"
echo ""
