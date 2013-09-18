require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class CairommNative < Formula
  homepage 'http://www.cairographics.org/cairomm/'
  url 'http://cairographics.org/releases/cairomm-1.10.0.tar.gz'
  sha1 'f08bf8a331067f0d1e876523f07238fba6b26b99'

  # depends_on 'cmake' => :build
  #depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on 'pkg-config' => :build
  depends_on 'libsigc++'
  depends_on 'cairo-native'
  depends_on 'fontconfig'    
  conflicts_with "cairomm", :because=>"installs the same binaries"
  
  keg_only "for inkscape"
  
  def install
    # ENV.j1  # if your formula's build system can't parallelize
    # ENV.append "PKG_CONFIG_PATH",":#{HOMEBREW_PREFIX}/pkgconfig"
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
    # were more thorough. Run the test with `brew test cairomm-native`.
    system "false"
  end
end
