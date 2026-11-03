class Ferb < Formula
  desc "Always-on conversation capture and transcription"
  homepage "https://ferb.live"
  # Packed from the private ferb repo's cli/ and attached to this tap's
  # releases, so installing needs no access to the source repo.
  url "https://github.com/disjointinc/homebrew-tap/releases/download/ferb-0.1.0/disjoint-ferb-0.1.0.tgz"
  sha256 "11ccce0291ae6efb3584c04c9efb0776b8ae2e6c27d3bd64d741c4fadf217f24"
  revision 1

  depends_on "node"
  depends_on "sox"
  depends_on :macos

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  service do
    run [opt_bin/"ferb", "start"]
    # launchd's default PATH has no Homebrew bin, where node and rec live.
    environment_variables PATH: std_service_path_env
    keep_alive true
    log_path var/"log/ferb.log"
    error_log_path var/"log/ferb.log"
  end
end
