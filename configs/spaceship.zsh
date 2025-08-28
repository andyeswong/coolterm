# Display time
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR="cyan"
SPACESHIP_TIME_FORMAT="%T"

# Display username always
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_COLOR="green"
SPACESHIP_USER_SUFFIX=""

# Host configuration
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_COLOR="blue"
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_HOST_SUFFIX=""

# Directory configuration
SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_COLOR="yellow"
SPACESHIP_DIR_PREFIX="in "
SPACESHIP_DIR_SUFFIX=" "
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_LOCK_SYMBOL="🔒"
SPACESHIP_DIR_LOCK_COLOR="red"

# Git configuration
SPACESHIP_GIT_SHOW=true
SPACESHIP_GIT_PREFIX="on "
SPACESHIP_GIT_SUFFIX=" "
SPACESHIP_GIT_SYMBOL=""
SPACESHIP_GIT_BRANCH_PREFIX=""
SPACESHIP_GIT_BRANCH_SUFFIX=""
SPACESHIP_GIT_STATUS_PREFIX=" ["
SPACESHIP_GIT_STATUS_SUFFIX="]"
SPACESHIP_GIT_STATUS_COLOR="red"
SPACESHIP_GIT_STATUS_UNTRACKED="?"
SPACESHIP_GIT_STATUS_ADDED="+"
SPACESHIP_GIT_STATUS_MODIFIED="!"
SPACESHIP_GIT_STATUS_RENAMED="»"
SPACESHIP_GIT_STATUS_DELETED="✘"
SPACESHIP_GIT_STATUS_STASHED="$"
SPACESHIP_GIT_STATUS_UNMERGED="="
SPACESHIP_GIT_STATUS_AHEAD="⇡"
SPACESHIP_GIT_STATUS_BEHIND="⇣"
SPACESHIP_GIT_STATUS_DIVERGED="⇕"

# Node.js configuration
SPACESHIP_NODE_SHOW=true
SPACESHIP_NODE_COLOR="green"
SPACESHIP_NODE_PREFIX="⬢ "
SPACESHIP_NODE_SUFFIX=" "

# Python configuration
SPACESHIP_PYTHON_SHOW=true
SPACESHIP_PYTHON_COLOR="yellow"
SPACESHIP_PYTHON_PREFIX="🐍 "
SPACESHIP_PYTHON_SUFFIX=" "

# Docker configuration
SPACESHIP_DOCKER_SHOW=true
SPACESHIP_DOCKER_COLOR="cyan"
SPACESHIP_DOCKER_PREFIX="🐳 "
SPACESHIP_DOCKER_SUFFIX=" "

# Package configuration
SPACESHIP_PACKAGE_SHOW=true
SPACESHIP_PACKAGE_COLOR="red"
SPACESHIP_PACKAGE_PREFIX="📦 "
SPACESHIP_PACKAGE_SUFFIX=" "

# Battery configuration
SPACESHIP_BATTERY_SHOW=always
SPACESHIP_BATTERY_THRESHOLD=20
SPACESHIP_BATTERY_CHARGING_SYMBOL="⚡"
SPACESHIP_BATTERY_DISCHARGING_SYMBOL="🔋"
SPACESHIP_BATTERY_FULL_SYMBOL="🔋"

# Exit code configuration
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL="✘"
SPACESHIP_EXIT_CODE_COLOR="red"
SPACESHIP_EXIT_CODE_PREFIX=" "
SPACESHIP_EXIT_CODE_SUFFIX=" "

# Jobs configuration
SPACESHIP_JOBS_SHOW=true
SPACESHIP_JOBS_COLOR="yellow"
SPACESHIP_JOBS_SYMBOL="⚙"
SPACESHIP_JOBS_PREFIX=" "
SPACESHIP_JOBS_SUFFIX=" "

# Execution time configuration
SPACESHIP_EXEC_TIME_SHOW=true
SPACESHIP_EXEC_TIME_PREFIX="took "
SPACESHIP_EXEC_TIME_SUFFIX=" "
SPACESHIP_EXEC_TIME_COLOR="yellow"
SPACESHIP_EXEC_TIME_ELAPSED=2

# Prompt order
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  python        # Python section
  docker        # Docker section
  package       # Package version section
  battery       # Battery level section
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# Right prompt order
SPACESHIP_RPROMPT_ORDER=(
  exec_time     # Execution time
  vi_mode       # Vi-mode indicator
)

# Add custom Ember section
# See: https://github.com/spaceship-prompt/spaceship-ember
spaceship add ember

# Add a custom vi-mode section to the prompt
# See: https://github.com/spaceship-prompt/spaceship-vi-mode
spaceship add --before char vi_mode

# Custom prompt character
SPACESHIP_CHAR_SYMBOL="➜"
SPACESHIP_CHAR_SYMBOL_ROOT="#"
SPACESHIP_CHAR_SYMBOL_SECONDARY="➜"
SPACESHIP_CHAR_COLOR_SUCCESS="green"
SPACESHIP_CHAR_COLOR_FAILURE="red"
SPACESHIP_CHAR_COLOR_SECONDARY="yellow"
