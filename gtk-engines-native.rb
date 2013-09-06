require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class GtkEnginesNative < Formula
  homepage 'http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/'
  url 'http://ftp.gnome.org/pub/gnome/sources/gtk-engines/2.20/gtk-engines-2.20.2.tar.bz2'
  sha1 '574c7577d70eaacecd2ffa14e288ef88fdcb6c2a'

  # depends_on 'cmake' => :build
  #depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on 'intltool' => :build
  depends_on 'gettext'
  depends_on 'cairo-native'
  depends_on 'gtk+-native'  
  
  conflicts_with "gtk-engines", :because=>"installs the same binaries"
  
  def install
    # ENV.j1  # if your formula's build system can't parallelize

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test gtk-engines-native`.
    system "false"
  end
end
