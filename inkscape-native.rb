require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class InkscapeNative < Formula
  homepage 'http://inkscape.org/'
  url 'http://downloads.sourceforge.net/inkscape/inkscape-0.48.4.tar.gz'
  sha1 'ce453cc9aff56c81d3b716020cd8cc7fa1531da0'
  
  depends_on 'pkg-config' => :build
  depends_on 'intltool'
  depends_on 'boost-build' => :build
  depends_on 'gettext'
  depends_on 'bdw-gc'
  depends_on 'glibmm'
  depends_on 'gtkmm-native'
  depends_on 'gsl'
  depends_on 'boost'
  depends_on 'popt'
  depends_on 'little-cms'
  depends_on 'cairomm-native'
  depends_on 'pango-native'
  depends_on 'poppler' => :optional
  depends_on 'hicolor-icon-theme'
  depends_on 'homebrew/versions/gcc47'  
  
  fails_with :clang
  
  conflicts_with "inkscape", :because=>"installs the same binaries"
  
  def patches
  	DATA
  end
  
  def install
  	# I am totally open to anyone who can make this better
  	# But in the past 24 hours I have compiled this like 10 times
  	# just know that if this isn't working you can download the inkscape package
  	# referenced above, extract it somewhere, force link gettext, and use the below patch
  	# to compile it
    # ENV.j1  # if your formula's build system can't parallelize
 	ENV['CC'] = "/usr/local/bin/gcc-4.7"
 	ENV['LD'] = "/usr/local/bin/gcc-4.7"
 	ENV['CXX'] = "/usr/local/bin/g++-4.7"
 	
 	#These shouldn't be needed, but I don't want to recompile inkscape to test that
 	ENV['LDFLAGS'] = " -L/usr/local/opt/gettext/lib #{`pkg-config pangoft2 --libs`}"
 	ENV['CXXFLAGS'] = " -I/usr/local/opt/gettext/include"
 	ENV['CFLAGS'] = " -I/usr/local/opt/gettext/include"
 	ENV['CPPFLAGS'] = " -I/usr/local/opt/gettext/include"

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--enable-lcms"
    #This is ugly but it works,
    # I should be able to modify the patch below to do this better
    # But, again, I don't want to
    system "make"#, "LDFLAGS=\"#{`pkg-config pangoft2 --libs`}\""
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test inkscape-native`.
    system "false"
  end
end

__END__
diff --git a/configure.ac b/configure.ac
index 0a19e48..59c3348 100644
--- a/configure.ac
+++ b/configure.ac
@@ -732,7 +732,7 @@ if test $cc_vers_major -gt 3; then
 else
   min_sigc_version=2.0.11
 fi
-PKG_CHECK_MODULES(INKSCAPE, gdkmm-2.4  glibmm-2.4 giomm-2.4 gtkmm-2.4 >= 2.10.0  gtk+-2.0  libxml-2.0 >= 2.6.11  libxslt >= 1.0.15  cairo  sigc++-2.0 >= $min_sigc_version  $ink_spell_pkg  gthread-2.0 >= 2.0 libpng >= 1.2 gsl)
+PKG_CHECK_MODULES(INKSCAPE, gdkmm-2.4  glibmm-2.4 giomm-2.4 gtkmm-2.4 >= 2.10.0  gtk+-2.0 pangoft2 libxml-2.0 >= 2.6.11  libxslt >= 1.0.15  cairo  sigc++-2.0 >= $min_sigc_version  $ink_spell_pkg  gthread-2.0 >= 2.0 libpng >= 1.2 gsl)
 
 dnl gtkmm provides no preprocessor macros for easily checking versions.  This check is used
 dnl to figure out if we are working with the newer 2.24 series or not.
diff --git a/src/Makefile.am b/src/Makefile.am
index 6bb15fc..dc78654 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -206,9 +206,9 @@ libinkscape_a_SOURCES = $(ink_common_sources)
 inkscape_SOURCES += main.cpp $(win32_sources)
 inkscape_LDADD = $(all_libs)
 if PLATFORM_OSX
-inkscape_LDFLAGS = --export-dynamic $(kdeldflags) $(mwindows)
+inkscape_LDFLAGS = $(kdeldflags) $(mwindows)
 else
-inkscape_LDFLAGS = -Wl,--export-dynamic $(kdeldflags) $(mwindows)
+inkscape_LDFLAGS = $(kdeldflags) $(mwindows)
 endif
 
 inkview_SOURCES += inkview.cpp $(win32_sources)
diff --git a/src/Makefile.in b/src/Makefile.in
index 11ae665..70ca30f 100644
--- a/src/Makefile.in
+++ b/src/Makefile.in
@@ -3013,8 +3013,8 @@ DISTCLEANFILES = \
 # this should speed up the build
 libinkscape_a_SOURCES = $(ink_common_sources)
 inkscape_LDADD = $(all_libs)
-@PLATFORM_OSX_FALSE@inkscape_LDFLAGS = -Wl,--export-dynamic $(kdeldflags) $(mwindows)
-@PLATFORM_OSX_TRUE@inkscape_LDFLAGS = --export-dynamic $(kdeldflags) $(mwindows)
+@PLATFORM_OSX_FALSE@inkscape_LDFLAGS = $(kdeldflags) $(mwindows)
+@PLATFORM_OSX_TRUE@inkscape_LDFLAGS = $(kdeldflags) $(mwindows)
 inkview_LDADD = $(all_libs)
 inkview_LDFLAGS = $(mwindows) 
 
