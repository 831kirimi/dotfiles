# dotfiles


```sh
cd dotfiles
./install.sh
```

## Brew
- Brewfileの生成 (`~/.Brewfile`)
```sh
brew bundle dump --global --force
```
- install
```sh
brew bundle --global
```

## Python
- 現在の設定を `requirement.txt` に書き出す
```sh
pip freeze > requirements.txt
```

- install
```
pip install -r requirements.txt
```