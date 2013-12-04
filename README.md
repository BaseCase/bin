# cjb's bash config

## setup

1. cd to the `bin/` folder and run `./install.sh`. This will symlink the relevant files into your home directory, so you'll only need to rerun it if you add a new dotfile.
2. Now compile the Command-T plugin for Vim:

```bash
cd ~/.vim/ruby/command-t
ruby extconf.rb
make
```

## adding a new dotfile

Any file in this folder named "dot\_\*" will be included in the install process.

## adding a new util script

Any file in the scripts/ folder is in the path, so just put anything here and make it executable to get it everywhere.

## local bash config

You can put any config stuff you don't want public in the local\_bash\_config file. It's gitignored, so go nuts.

