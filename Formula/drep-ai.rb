class DrepAi < Formula
  desc "AI-powered code review and documentation quality tool"
  homepage "https://github.com/slb350/drep"
  url "https://files.pythonhosted.org/packages/1f/5b/c778af47b4705042b57c0691ed317c75f52719c3c92262232af665be50b3/drep_ai-0.9.0.tar.gz"
  sha256 "fae28c5d514723d1d4f81452f615dbf32cc5e1b7ba7e3d71d65238ffe695704b"
  license "MIT"

  depends_on "python@3.11"

  def install
    # Create a virtualenv
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "venv", libexec

    # Upgrade pip, setuptools, and wheel in the venv
    system libexec/"bin/pip", "install", "--upgrade", "pip", "setuptools", "wheel"

    # Install drep-ai from PyPI with all dependencies
    # This allows pip to use binary wheels for Rust-compiled packages
    system libexec/"bin/pip", "install", "drep-ai==0.9.0"

    # Create symlink for the executable
    bin.install_symlink libexec/"bin/drep"
  end

  test do
    assert_match "Documentation & Review Enhancement Platform", shell_output("#{bin}/drep --help")
  end
end