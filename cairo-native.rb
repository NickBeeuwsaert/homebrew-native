require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class CairoNative < Formula
  homepage 'http://www.cairographics.org/'
  url 'http://cairographics.org/releases/cairo-1.12.16.tar.xz'
  sha1 '4f6e337d5d3edd7ea79d1426f575331552b003ec'

  # depends_on 'cmake' => :build
  # depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on 'pkg-config'
  depends_on :libpng
  depends_on 'pixman'
  depends_on 'glib'
  depends_on 'freetype'    
  depends_on 'fontconfig'

  conflicts_with "cairo", :because=>"installs the same binaries"

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
    					  "--enable-quartz=yes", "--enable-quartz-image",
    					  "--enable-xlib=no", "--enable-xlib-xrender=no",
    					  "--without-x", "--enable-xcb-shm=no", "--enable-xcb=no",
    					  "--enable-gobject=yes", "--enable-ft=yes",
                          "--enable-fc=yes",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test cairo-native`.
    system "false"
  end
end
