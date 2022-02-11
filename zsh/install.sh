echo "downloading .zshrc"

if [[ -z "$HOME" ]]; then
    echo "Home not set"
    exit
fi

