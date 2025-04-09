# tree-sitter cli installation

```bash
sudo apt-get install npm

npm install -g tree-sitter-cli

which tree-sitter
```

If this doesn't work, use *nvm*. Check for newer versions.

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install 20

npx tree-sitter-cli --version
```

Maybe adding *node_modules* to path is needed.

```bash
export PATH=$PATH:./node_modules/.bin
```
