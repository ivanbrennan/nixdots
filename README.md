### Install

``` sh
bash -c "$(curl -fsSL https://api.github.com/repos/ivanbrennan/nixdots/contents/init.sh \
                -H 'Accept: application/vnd.github-blob.raw')" \
     'init.sh' --github-host github.com
```
If you're using an SSH config file to manage multiple identities, you can use the `--github-host` flag to specify the appropriate Host.
