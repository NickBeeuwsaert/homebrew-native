require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class PangommNative < Formula
  homepage 'https://developer.gnome.org/pangomm/2.34/'
  url 'http://ftp.gnome.org/pub/GNOME/sources/pangomm/2.34/pangomm-2.34.0.tar.xz'
  sha1 '15d89717a390a0c78c01871190c8febd29dad684'

  # depends_on 'cmake' => :build
  # depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on 'xz' => :build
  depends_on 'pkg-config' => :build
  depends_on 'pango-native'
  depends_on 'glibmm'
  depends_on 'cairomm-native'
  
  keg_only "for inkscape"
  conflicts_with "pangomm", :because=>"installs the same binaries"
  
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
    # were more thorough. Run the test with `brew test pangomm-native`.
    system "false"
  end
end
