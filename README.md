# Vault Browser

Right now this is a development workflow test, in the future a project to browse a HashiCorp Vault file structure.

## Installation

```
git clone https://github.com/cartman640/vault-browser.git
cd vault-browser
git checkout dev
ddev build
```

## Development
In the vault-browser folder:

```
vault-browser debug src
```

Will start the node server in debug mode with the files at `src` mounted in the application. After modifying code, running `ddev build` will build the files back into the image.