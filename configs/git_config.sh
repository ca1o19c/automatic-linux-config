echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Caio Antonio\""
read git_config_user_name

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"caio.antonio.c@outlook.com\""
read git_config_user_email

ssh-keygen -t ed25519 -C "$git_config_user_email"
eval "$(ssh-agent -s)"

echo "Setting up your git global user name, email and code"
git config --global user.name "$git_config_user_name"
git config --global user.email "$git_config_user_email"
git config --global core.editor vim
