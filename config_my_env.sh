sudo apt update
sudo apt install -y git zsh curl wget tmux xclip software-properties-common
sudo add-apt-repository ppa:maveonair/helix-editor && sudo apt update && sudo apt install -y helix
mkdir -p ~/.zshpkg
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.zshpkg/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zshpkg/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zshpkg/powerlevel10k
git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search.git ~/.zshpkg/zsh-history-substring-search
git clone --depth=1 https://github.com/agkozak/zsh-z.git ~/.zshpkg/zsh-z

cp .zshrc ~/
cp .p10k.zsh ~/

cd
git clone --depth=1 https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .


chsh -s /bin/zsh
exit
