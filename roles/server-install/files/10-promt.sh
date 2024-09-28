#!/bin/bash

# Set user color based on current user
if [[ $(whoami) == "root" ]]; then
  USER_COLOR="1;31m"  # bold red for root
else
  USER_COLOR="1;31m"
fi

# Determine environment from /etc/env file or default to 'prod'
if [[ -e /etc/env ]]; then
  ENV=$(awk '{print tolower($0)}' /etc/env)
else
  ENV='prod'
fi

# Set environment color based on the environment
case ${ENV} in
  *dev*|*test*) ENV_COLOR="92m" ;;
  *stage*)     ENV_COLOR="93m" ;;
  *load*)      ENV_COLOR="95m" ;;
  *)           ENV_COLOR="91m" ;;
esac

# Add date to history
HISTTIMEFORMAT="%Y-%m-%d %T "

# Set prompt
PS1="\[\033[36m\][\t] \[\033[${ENV_COLOR}\][${ENV}] \[\033[0m\][\[\033[${USER_COLOR}\]\u\[\033[0m\]@\h:\[\033[36m\][\w]\[\033[0m\]]\$ "
