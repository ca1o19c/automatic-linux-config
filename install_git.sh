echo -e "echo Installing GIT and config SSH, it's very fast\n"

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Caio Cichetti\""
read git_config_user_name

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"caio_cichetti@outlook.com\""
read git_config_user_email

echo "What is your github username?"
echo "For example, mine will be \"caiocichetti\""
read username

echo -e "Setting up your git global user name and email\n"
git config --global user.name "$git_config_user_name"
git config --global user.email $git_config_user_email
