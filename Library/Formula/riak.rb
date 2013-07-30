require 'formula'

class Riak < Formula
  homepage 'http://wiki.basho.com/Riak.html'

  if Hardware.is_64_bit? and not build.build_32_bit?
    url 'http://s3.amazonaws.com/downloads.basho.com/riak/1.4/1.4.0/osx/10.8/riak-1.4.0-OSX-x86_64.tar.gz'
    version '1.4.0-x86_64'
    sha256 '4830b9e00b520b8494264017bfc2ff10753fd51b9e013bafd3054e29e5be1443'
  else
    url 'http://s3.amazonaws.com/downloads.basho.com/riak/1.3/1.3.1/osx/10.6/riak-1.3.1-osx-i386.tar.gz'
    version '1.3.1-i386'
    sha256 '1169ddcbc1a613c734f3df7350b416e84c667faaae73b647d2fa696aa45bc085'
  end

  skip_clean 'libexec'

  option '32-bit'

  def install
    libexec.install Dir['*']

    # The scripts don't dereference symlinks correctly.
    # Help them find stuff in libexec. - @adamv
    inreplace Dir["#{libexec}/bin/*"] do |s|
      s.change_make_var! "RUNNER_SCRIPT_DIR", "#{libexec}/bin"
    end

    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
