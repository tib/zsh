# Personal ZSH configuration

Add these lines to the `.zshrc` file:

```sh
unset MAILCHECK
EDITOR=vi
ZSH_THEME="simple"
plugins=(git git-aliases my-aliases zsh-autosuggestions swiftpm)
```

Fix permissions: 
```sh
chmod -R 755 ./.oh-my-zsh/custom
```

Add this to `crontab -e` to auto update brew:

```sh
MAILTO=""
   
0 8 * * * /opt/homebrew/bin/brew update && /opt/homebrew/bin/brew upgrade && /opt/homebrew/bin/brew cleanup --prune=all && /opt/homebrew/bin/brew doctor
```