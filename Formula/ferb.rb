class Ferb < Formula
  desc "Always-on conversation capture and transcription"
  homepage "https://ferb.live"
  url "https://registry.npmjs.org/@disjoint/ferb/-/ferb-0.1.0.tgz"
  sha256 "<sha256 of that tarball>"

  depends_on "node"
  depends_on "sox"
  depends_on :macos

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  service do
    run [opt_bin/"ferb", "start"]
    keep_alive true
    log_path var/"log/ferb.log"
    error_log_path var/"log/ferb.log"
  end
end
