class DrepAi < Formula
  desc "AI-powered code review and documentation quality tool"
  homepage "https://github.com/slb350/drep"
  url "https://files.pythonhosted.org/packages/79/1b/094f99e626a1d856be6094e6129a1f1bc91cd92841493a9988ced55f0694/drep_ai-0.8.2.tar.gz"
  sha256 "a8ae2c5ca206622de404757dbda1e1066c9fc94ba2cb980ccb0c1b1615dd6bcf"
  license "MIT"

  depends_on "python@3.11"

  def install
    # Create a virtualenv
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "venv", libexec

    # Upgrade pip, setuptools, and wheel in the venv
    system libexec/"bin/pip", "install", "--upgrade", "pip", "setuptools", "wheel"

    # Install drep-ai from PyPI with all dependencies
    # This allows pip to use binary wheels for Rust-compiled packages
    system libexec/"bin/pip", "install", "drep-ai==0.8.2"

    # Create symlink for the executable
    bin.install_symlink libexec/"bin/drep"
  end

  test do
    assert_match "0.8.2", shell_output("#{bin}/drep --version")
  end
end