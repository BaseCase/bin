# cjb's bash config

## setup

1. cd to the `bin/` folder and run `./install.sh`. This will symlink the
relevant files into your home directory, so you'll only need to rerun it if you
add a new dotfile.

2. Edit ~/.bashrc so that `CJB_BIN` points to the right path.

3. Install Vundle for Vim: `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`

4. Install all the Vundle plugins: in Vim, run `:BundleInstall`

5. Now compile the Command-T plugin for Vim:

```bash
cd ~/.vim/bundle/Command-T/ruby/command-t
ruby extconf.rb
make```


## adding a new dotfile

Any file in this folder named "dot\_*" will be included in the install process.

## adding a new util script

Any file in the scripts/ folder is in the path, so just put anything here and
make it executable to get it everywhere.

## local bash config

You can put any config stuff you don't want public in the local_bash_config
file. It's gitignored, so go nuts.


## Watch out

For some reason I don't understand, the install script creates a bonus file
under bin/dot_vim...dunno what's up with that yet.


# Wishlist/TODO

- [X] the install.sh script seems to kind of be janky right now...might wanna
  fix that.
- [ ] prune this whole repo...it's a little bit too much right now
- [ ] add current git branch to prompt
- [ ] in Vim, go to last opened position in a file
- [ ] find a really good plugin for Emacs-style (un)comment-region
- [X] in Vim, C-] should open tag choices list if there is more than one match,
  else just jump to single tag
