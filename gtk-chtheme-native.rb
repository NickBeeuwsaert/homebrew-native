require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class GtkChthemeNative < Formula
  homepage 'http://plasmasturm.org/code/gtk-chtheme/'
  url 'http://plasmasturm.org/code/gtk-chtheme/gtk-chtheme-0.3.1.tar.bz2'
  sha1 'dbea31f4092877e786fe040fae1374238fada94a'

  # depends_on 'cmake' => :build
  #depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on 'pkg-config' => :build
  depends_on 'gdk-pixbuf'
  depends_on 'gettext'
  depends_on 'glib'
  depends_on 'gtk+-native'
  depends_on 'pango-native'
  
  conflicts_with "gtk-chtheme", :because=>"installs the same binaries"
  
  # keg_only "for inkscape"
  

  def install
    # Unfortunately chtheme relies on some deprecated functionality
    # we need to disable errors for it to compile properly
    inreplace 'Makefile', '-DGTK_DISABLE_DEPRECATED', ''

    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test gtk-chtheme-native`.
    system "false"
  end
end
