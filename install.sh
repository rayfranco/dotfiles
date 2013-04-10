echo 'Get ready to see some magic happen ! At your own risk, Django.'

# Clone this repo
dir="$HOME/.dotfiles/rayfranco/"
mkdir -p $dir
cd $dir
git clone git://github.com/RayFranco/dotfiles.git
cd dotfiles

# OH My ZSH
if [ -d ~/.oh-my-zsh ]
then
	echo "\033[0;33mGreat ! Looks like you already have Oh My Zsh installed.\033[0m"
else
	echo "\033[0;34mCloning Oh My Zsh...\033[0m"
	hash git >/dev/null && /usr/bin/env git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh || {
	  echo "git not installed"
	  exit 1
	}
fi

# Install ZSH settings
echo "\033[0;34mLooking for an existing zsh config...\033[0m"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]
then
  echo "\033[0;33mFound ~/.zshrc.\033[0m \033[0;32mBacking up to ~/.zshrc.pre-oh-my-zsh\033[0m";
  mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
fi

echo "\033[0;34mUsing the Oh My Zsh template file and adding it to ~/.zshrc\033[0m"
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

read -p "Would you like to change to change to zsh now? (y/n)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "\n"
	chsh -s `which zsh`	
	echo "\n\033[0;34mNow running zsh !\033[0m"
	echo "\033[0;32m"'         __                                     __   '"\033[0m"
	echo "\033[0;32m"'  ____  / /_     ____ ___  __  __   ____  _____/ /_  '"\033[0m"
	echo "\033[0;32m"' / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \ '"\033[0m"
	echo "\033[0;32m"'/ /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / / '"\033[0m"
	echo "\033[0;32m"'\____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/  '"\033[0m"
	echo "\033[0;32m"'                        /____/                       '"\033[0m"

else
	echo "\n\033[0;34mOh.. What ever you want... Good bye !\033[0m"
	exit 1
fi

echo "\n"
sudo bash ${dir}bin/symlink-dotfiles.sh

# Start symlinking
read -p "\033[0;34mAll right cow boy, it's a good start. You can now run the bootstrap.sh! Do you want me to do it for you? (y/n)\033[0m" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "\n"
	source $dir/bootstrap.sh
else
	echo "\n\033[0;34mWhen you want ! Run sh ~/.dotfiles/rayfranco/boostrap.sh\033[0m"
fi