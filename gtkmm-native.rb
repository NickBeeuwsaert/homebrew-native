require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class GtkmmNative < Formula
  homepage 'http://www.gtkmm.org/en/'
  url 'http://ftp.gnome.org/pub/GNOME/sources/gtkmm/2.24/gtkmm-2.24.4.tar.xz'
  sha1 'e99866b0cb5a0d7387a7cef79253177310020b3d'

  # depends_on 'cmake' => :build
  #depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on 'xz' => :build
  depends_on 'pkg-config' => :build
  depends_on 'glibmm'
  depends_on 'gtk+-native'
  depends_on 'libsigc++'
  depends_on 'pangomm-native'
  depends_on 'atkmm'
  depends_on 'cairomm-native'
  
  keg_only "for inkscape"
  
  conflicts_with "gtkmm", :because=>"installs the same binaries"
  
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
    # were more thorough. Run the test with `brew test gtkmm-native`.
    system "false"
  end
end
