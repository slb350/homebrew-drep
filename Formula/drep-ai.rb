class DrepAi < Formula
  desc "AI-powered code review and documentation quality tool"
  homepage "https://github.com/slb350/drep"
  url "https://files.pythonhosted.org/packages/af/9d/a19d6a37214782c6813f0da05fab77ed2e83a48fba75d7e5de37d72b5936/drep_ai-1.1.0.tar.gz"
  sha256 "20ccc779add78ebd256b641a7041a4339e2e11369c92b855bbb09ef9e7125fb8"
  license "MIT"

  depends_on "python@3.11"

  def install
    # Create a virtualenv
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "venv", libexec

    # Upgrade pip, setuptools, and wheel in the venv
    system libexec/"bin/pip", "install", "--upgrade", "pip", "setuptools", "wheel"

    # Install drep-ai from PyPI with all dependencies
    # This allows pip to use binary wheels for Rust-compiled packages
    system libexec/"bin/pip", "install", "drep-ai==1.1.0"

    # Create symlink for the executable
    bin.install_symlink libexec/"bin/drep"
  end

  test do
    assert_match "Documentation & Review Enhancement Platform", shell_output("#{bin}/drep --help")
  end
end