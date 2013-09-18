require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class GtkxNative < Formula
  homepage 'http://www.gtk.org/'
  url 'http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.20.tar.xz'
  sha1 '89315bf05dd3d626a50bae5417942ee4428012c9'

  # depends_on 'cmake' => :build
  #depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on "atk"
  depends_on "cairo-native"
  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "gdk-pixbuf"
  depends_on "gettext"
  depends_on "glib"
  depends_on "icu4c"
  depends_on "jpeg"
  depends_on "libffi"
  depends_on :libpng
  depends_on "libtiff"
  depends_on "pango-native"
  depends_on "pixman"
  depends_on "pkg-config"
  depends_on "xz"

  #keg_only "for inkscape"
  
  conflicts_with "gtk+", :because=>"installs the same binaries"
  
  
  
  def install
    # ENV.j1  # if your formula's build system can't parallelize

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--without-x",
                          "--with-gdktarget=quartz", "--disable-xkb",
                          "--disable-xinerama", "--without-xinput",
                          "--disable-glibtest", "--disable-introspection"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test gtk+-native`.
    system "false"
  end
end
