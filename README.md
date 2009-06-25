A simple emacs setup for Rails
==============================

Uses the very excellent emacs-rails, yasnippet and fuzzy-find-in-projects loaded as git submodules. First git clone this repo as ~/.emacs.d:

    cd ~
    git clone git://github.com/thomasn/thomasn-emacs-d .emacs.d 
    cd .emacs.d
    git submodule update --init
    sudo gem install rcodetools fastri

Start `fastri-server &` before starting your emacs sessions - on Gentoo, perhaps add it to /etc/conf.d/local.start

Open a Rails project, navigate to a controller, hit "Ctrl-C m" (in emacs-speak, "C-c m") to go to the corresponding model, move onto a Rails method like validates_presence_of, press F1 and help is baked in.

See the Peepcode emacs screencast for more.

This includes wacky keybindings of my own so use at your own peril. I also bind `GNU screen` to use "C-\" instead of the default "C-a" - see emacswiki.org.

-- Thomas

TODO: find elegant way to make gems docs accessible to ri. Current hacky solution:

    # Tell ri to search system rdocs:
    mkdir -p ~/.gem/ruby/1.8/usr/lib/ruby/gems/1.8
    ln -s /usr/lib/ruby/gems/1.8/doc ~/.gem/ruby/1.8/usr/lib/ruby/gems/1.8/

