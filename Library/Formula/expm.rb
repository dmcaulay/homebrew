require 'formula'

class Expm < Formula
  homepage 'http://expm.co/'
  url 'https://github.com/yrashk/expm/archive/0.1.tar.gz'
  sha1 '3dcc3f081eb53543e297f03e7e64cdf653065720'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test expm`.
    system "false"
  end
end
