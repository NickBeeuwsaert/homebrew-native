require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Gtkmm3Native < Formula
  homepage ''
  url 'http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.8/gtkmm-3.8.0.tar.xz'
  sha1 'e0da5ce735480aadfb52150997d8644078df72f8'

  # depends_on 'cmake' => :build
  depends_on 'xz' => :build
  depends_on 'pkg-config' => :build
  depends_on 'glibmm'
  depends_on 'gtk+3-native'
  depends_on 'libsigc++'
  depends_on 'pangomm-native'
  depends_on 'atkmm'
  depends_on 'cairomm-native'

  conflicts_with 'gtkmm3', :because => "Installs the same binaries"

  keg_only "for inkscape"
  
  def install
    # ENV.j1  # if your formula's build system can't parallelize

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--enable-quartz-backend",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test gtkmm3-native`.
    system "false"
  end
end
