# BASH_PROFILE - Ignasi Blanco - 2013
#
export JAVA_HOME=/usr

# This are the common variables for Amazon AWS tools
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_EC2_REGION=
export AWS_HOME=~/.ec2/
export EC2_PRIVATE_KEY=`ls $AWS_HOME/pk-*.pem`
export EC2_CERT=`ls $AWS_HOME/cert-*.pem`
export EC2_HOME=~/.ec2
export AWS_ELB_HOME=~/.ec2
export AWS_IAM_HOME=~/.ec2
export AWS_RDS_HOME=~/.ec2
export AWS_CREDENTIAL_FILE=~/.ec2/aws-credential

# AWS Endpoints
export EC2_URL=https://ec2.eu-west-1.amazonaws.com
export RDS_URL=https://rds.eu-west-1.amazonaws.com
export AWS_ELB_URL=https://elasticloadbalancing.eu-west-1.amazonaws.com
export PATH=$PATH:$AWS_EC2_HOME/bin:$AWS_AUTO_SCALING_HOME/bin:$AWS_ELB_HOME/bin:$AWS_IAM_HOME/bin:$AWS_RDS_HOME/bin:$AWS_CLOUDWATCH_HOME/bin

if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
fi

# Git status bash prompt
#
# In addition to printing the current working directory, this prompt will
# show a number of things if you are in a git repository:
# - The current branch you are in
# - Whether there are untracked files in the repository (there will be an
#   asterisk after the branch nome if there are)
# - Whether there are any unmerged/unstaged/staged changes or if the directory
#   is clean. See below for the colors that will be used, and change them if
#   you'd like.

# Storing these color codes for later use
txtblk='\033[0;30m' # Black - Regular
txtred='\033[0;31m' # Red
txtgrn='\033[0;32m' # Green
txtylw='\033[0;33m' # Yellow
txtblu='\033[0;34m' # Blue
txtpur='\033[0;35m' # Purple
txtcyn='\033[0;36m' # Cyan
bldblk='\033[1;30m' # Black - Bold
bldred='\033[1;31m' # Red
bldgrn='\033[1;32m' # Green
bldylw='\033[1;33m' # Yellow
bldblu='\033[1;34m' # Blue
bldpur='\033[1;35m' # Purple
bldcyn='\033[1;36m' # Cyan

# Set color for the directory listing in the prompt
dir_listing_color=$bldgrn

# Set colors for different repository states
unmerged_color=$bldpur
unstaged_color=$bldred
staged_color=$bldcyn
clean_color=$bldblu

function git_color {
  git_status=`git status 2> /dev/null`

  if [ -n "`echo $git_status | grep "# Unmerged paths:"`" ]; then
    echo -e $unmerged_color
  elif [ -n "`echo $git_status | grep "# Changes not staged for commit:"`" ]; then
    echo -e $unstaged_color
  elif [ -n "`echo $git_status | grep "# Changes to be committed:"`" ]; then
    echo -e $staged_color
  else
    echo -e $clean_color
  fi
}

function git_branch {
  git_branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ -n  "`git status 2> /dev/null | grep "# Untracked files:"`" ]; then
    untracked="*"
  fi
  if [ "`expr "$git_branch" : '.*'`" -gt "0" ]; then
    echo \($git_branch$untracked\)
  fi
}

PS1='\u\[`echo -e $dir_listing_color`\]\w \[`git_color`\]`git_branch` \[\e[0m\]$ '
PS2="> "

# ALIAS
## Colorize the ls output ##
alias ls='ls -G'
## Use a long listing format ##
alias ll='ls -la'
## Show hidden files ##
#alias l.='ls -dG .*'

### Added by the Heroku Toolbelt
export PATH="~/.rbenv/shims:/usr/local/heroku/bin:$PATH"
eval "$(rbenv init -)"
