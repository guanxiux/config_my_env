sudo apt update
sudo apt install -y git zsh curl wget zsh-autosuggestions zsh-syntax-highlighting tmux
mkdir -p ~/.zshpkg
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zshpkg/powerlevel10k
git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search.git ~/.zshpkg/zsh-history-substring-search
git clone --depth=1 https://github.com/agkozak/zsh-z.git ~/.zshpkg/zsh-z

# git clone --depth=1 https://github.com/guanxiux/myzsh.git ~/.zshpkg/myzsh
cp .zshrc ~/
cp .p10k.zsh ~/

cd
git clone --depth=1 https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# Install NVIM
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
sudo tar -xf nvim-linux64.tar.gz -C /opt
sudo rm /usr/bin/vim
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/vim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

chsh -s /bin/zsh
exit
