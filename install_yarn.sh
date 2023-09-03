echo "Installing Yarn"
wget -qO- "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update && sudo apt-get install --no-install-recommends yarn
echo '"--emoji" true' >>~/.yarnrc

echo "Installing Typescript, AdonisJS CLI and Lerna"
yarn global add typescript @adonisjs/cli lerna
clear
