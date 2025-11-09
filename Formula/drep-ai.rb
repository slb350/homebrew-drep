class DrepAi < Formula
  desc "AI-powered code review and documentation quality tool"
  homepage "https://github.com/slb350/drep"
  url "https://files.pythonhosted.org/packages/88/93/838bf9bbbc9f359de1daef8925bf9bff9aeb4d562a32a26bb44cdc82e58a/drep_ai-1.0.0.tar.gz"
  sha256 "b51a8e5e6394478246425fa857b9f39bcb2e9603f3b4d563df7ea531269fe8c0"
  license "MIT"

  depends_on "python@3.11"

  def install
    # Create a virtualenv
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "venv", libexec

    # Upgrade pip, setuptools, and wheel in the venv
    system libexec/"bin/pip", "install", "--upgrade", "pip", "setuptools", "wheel"

    # Install drep-ai from PyPI with all dependencies
    # This allows pip to use binary wheels for Rust-compiled packages
    system libexec/"bin/pip", "install", "drep-ai==1.0.0"

    # Create symlink for the executable
    bin.install_symlink libexec/"bin/drep"
  end

  test do
    assert_match "Documentation & Review Enhancement Platform", shell_output("#{bin}/drep --help")
  end
end