got_github_pubkey() {
    local pubkey=4AEE18F83AFDEB23
    gpg --list-public-keys --with-colons | grep -q $pubkey
}

get_github_pubkey() {
    local url=https://github.com/web-flow.gpg
    local out=$(mktemp pubkey.XXXXXXXX)
    curl $url --output $out && gpg --import $out && rm $out
}

if ! got_github_pubkey; then
    echo 'Importing GitHub public GPG key'
    get_github_pubkey
    printf '%s%s✓%s Done\n' $(tput bold) $(tput setaf 2) $(tput sgr0)
fi
