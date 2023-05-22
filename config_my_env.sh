sudo apt update
sudo apt install -y git zsh curl wget zsh-autosuggestions zsh-syntax-highlighting tmux
mkdir -p ~/.zshpkg
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zshpkg/powerlevel10k
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.zshpkg/zsh-history-substring-search

# git clone --depth=1 https://github.com/guanxiux/myzsh.git ~/.zshpkg/myzsh
cp .zshrc ~/
cp .p10k.zsh ~/

cd
git clone --depth=1 https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
