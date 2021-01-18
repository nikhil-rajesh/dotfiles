# Dotfiles for @Ph4t3

## Install
*Note: For complete tutorial go [here](https://www.atlassian.com/git/tutorials/dotfiles).*

* add alias to .zshrc/.bashcrc and run in current shell scope too
    ```
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    ```
* clone this repo to $HOME/.cfg
    ```
    git clone --bare git@github.com:Ph4t3/dotfiles.git $HOME/.cfg
    ```
* checkout
    ```
    config checkout
    ```
* Set the flag *showUntrackedFiles* to *no*, so that *git status* wont be messed up.
    ```
    config config --local status.showUntrackedFiles no
    ```
