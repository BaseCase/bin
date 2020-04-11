# cjb's bash config
## setup
1. cd to the `bin/` folder and run `./install.sh`. This will symlink the
   relevant files into your home directory, so you'll only need to rerun it if
   you add a new dotfile.

2. Edit ~/.bashrc so that `CJB_BIN` points to the right path.


## vim setup
1. Install Vim plugins by starting Vim and running `:PlugInstall`


## emacs setup
1. Launch Emacs
2. Run `M-x package-list-packages`
3. Run `M-x package-install-selected-packages`
4. Restart Emacs

### install modern ctags
If you want TAGS file support, grab the maintained Universal ctags like this:
```
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
```

## adding a new dotfile
Any file in this folder named "dot\_*" will be included in the install process.


## adding a new util script
Any file in the scripts/ folder is in the path, so just put anything here and
make it executable to get it everywhere.


## local bash config
You can put any config stuff you don't want public in the local_bash_config
file. It's gitignored, so go nuts.
