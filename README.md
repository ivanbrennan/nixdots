### Install

``` sh
bash <(curl -fsSL https://api.github.com/repos/ivanbrennan/nixdots/contents/init \
            -H 'Accept: application/vnd.github-blob.raw')" \
     --github-host github.com
```
If you're using an SSH config file to manage multiple identities, you can use the `--github-host` flag to specify the appropriate Host.

### Todo

Fix Ctrl-Enter in alacritty shell
Fix autoload of `_tmux` bash completion.
Fix `_tmux` bash completion to default to filenames if no completion found.
```
╭~
╰(ivan)• t new -s sumall -c ~/Develbash: completion: function `_tmux' not found
╰(ivan)• t new -s sumall -c ~/Develobash: completion: function `_tmux' not found
╰(ivan)• tmux new-
new-session  new-window
```

Configure Mutt to pull contacts from lbdb, integrated with Gmail contacts and Apple address book
https://annvix.com/using_mutt_on_os_x
Wrap stow command(s) in make
