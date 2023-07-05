awk '!a[$0]++' $HISTFILE > /tmp/zsh_history
mv /tmp/zsh_history $HISTFILE