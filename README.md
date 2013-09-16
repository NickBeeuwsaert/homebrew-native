Homebrew-native
===============
This here is a homebrew tap so you can compile GTK+ applications without the need for XQuartz
NOTE
====
PLEASE PLEASE PLEASE submit bug requests if it doesn't work out of the box, I don't know if some of the libraries compiled fine
because of my system configuration, it would be greate if I could test this in a stock OSX install, but I can't do that D:

Info!
-----
Before you install anything you should execute

    brew unlink {cairomm,gtk+3,gtk-engines,gtkmm3,inkscape,pangomm,cairo,gtk+,gtk-chtheme,gtkmm,harfbuzz,pango}

then install your homebrew natives

Also, if you want to switch back to regular homebrew with XQuartz

    brew unlink {cairomm,gtk+3,gtk-engines,gtkmm3,inkscape,pangomm,cairo,gtk+,gtk-chtheme,gtkmm,harfbuzz,pango}-native
    brew link {cairomm,gtk+3,gtk-engines,gtkmm3,inkscape,pangomm,cairo,gtk+,gtk-chtheme,gtkmm,harfbuzz,pango}
    
NOTES
-----

* Inkscape works *flawlessly*, but there is no integrated menu bar support.
* GIMP compiles and runs (And has a integrated menu bar), But as soon as you close a image, it will crash (feel free to find a way to fix that)
* I am lazy and didn't put tests in. I should do that, sometime.
* GTK+3 is included because I was trying to get inkscape to compile with the experimental GTK+3 backend, but I kinda gave up on that (if you want to take a stab at it, you have to check out their hg repository and configure with --enable-gtk3-experimental)
* (To be clear: I got it compiled, and I should probably add a gdl3 formula, but inkscape kept crashing when I open a menu)
