require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class HarfbuzzNative < Formula
  homepage 'http://www.freedesktop.org/wiki/Software/HarfBuzz/'
  url 'http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-0.9.20.tar.bz2'
  sha1 '82c3c0d461f239d0991e660a5895a11d1c75e535'

  # depends_on 'cmake' => :build
  # depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'cairo-native'
  depends_on 'icu4c' => :recommended
  depends_on :freetype
  
  conflicts_with "harfbuzz", :because=>"installs the same binaries"
  
  #keg_only "for inkscape"

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
    # were more thorough. Run the test with `brew test harfbuzz-native`.
    system "false"
  end
end
