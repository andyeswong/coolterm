# Cool Spaceship Theme - Enhanced version
# Based on spaceship-prompt/spaceship-prompt

# Load Spaceship
source ~/.config/spaceship.zsh

# Additional cool features
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

# Cool welcome message function
cool_welcome() {
    local colors=("🟥" "🟧" "🟨" "🟩" "🟦" "🟪" "🟫" "⬜")
    local color=${colors[$RANDOM % ${#colors[@]}]}
    echo "$color Welcome to PurpleMX Terminal! $color"
}

# Random fortune cookie
random_fortune() {
    local fortunes=(
        "🚀 Keep coding, keep learning!"
        "💡 The best code is no code at all"
        "🎯 Focus on what matters most"
        "🌟 You're doing great!"
        "🔥 Stay passionate about coding"
        "⚡ Speed is a feature"
        "🎨 Code is art, make it beautiful"
        "🔧 Fix one bug, prevent two more"
        "💜 PurpleMX - Your terminal, your way!"
        "🚀 PurpleMX Terminal - Enhanced productivity!"
    )
    local fortune=${fortunes[$RANDOM % ${#fortunes[@]}]}
    echo "$fortune"
}

# Cool prompt prefix
cool_prompt_prefix() {
    local time_color="%F{cyan}"
    local user_color="%F{green}"
    local host_color="%F{blue}"
    local dir_color="%F{yellow}"
    
    echo "$time_color%T $user_color%n$host_color@%m $dir_color%~"
}

# Enhanced right prompt
cool_right_prompt() {
    local git_info=$(git_prompt_info 2>/dev/null)
    local node_version=$(node --version 2>/dev/null | cut -d'v' -f2)
    local python_version=$(python3 --version 2>/dev/null | cut -d' ' -f2)
    
    local right_prompt=""
    
    if [[ -n "$git_info" ]]; then
        right_prompt+="%F{red}git: $git_info%f "
    fi
    
    if [[ -n "$node_version" ]]; then
        right_prompt+="%F{green}⬢ $node_version%f "
    fi
    
    if [[ -n "$python_version" ]]; then
        right_prompt+="%F{yellow}🐍 $python_version%f "
    fi
    
    echo "$right_prompt"
}

# Set up the prompt
setopt PROMPT_SUBST
PROMPT='$(cool_prompt_prefix) %F{white}➜%f '
RPROMPT='$(cool_right_prompt)'

# Cool features on directory change
cool_chpwd() {
    if [[ -d ".git" ]]; then
        echo "📁 Git repository detected!"
        git status --short 2>/dev/null | head -5
    fi
    
    if [[ -f "package.json" ]]; then
        echo "📦 Node.js project detected!"
        echo "   Dependencies: $(jq '.dependencies | keys | length' package.json 2>/dev/null || echo 'unknown')"
    fi
    
    if [[ -f "requirements.txt" ]]; then
        echo "🐍 Python project detected!"
        echo "   Dependencies: $(wc -l < requirements.txt) packages"
    fi
}

# Add hooks
add-zsh-hook chpwd cool_chpwd

# Cool aliases for this theme
alias theme-help='echo "🎨 Cool Spaceship Theme Commands:" && echo "  theme-help: Show this help" && echo "  cool-welcome: Show welcome message" && echo "  fortune: Show random fortune" && echo "  colors: Show available colors"'

# Show available colors
alias colors='for code in {000..255}; do echo -n "\\e[38;5;${code}m $code"; done; echo'

# Initialize
cool_welcome
random_fortune
