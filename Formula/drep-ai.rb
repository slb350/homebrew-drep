class DrepAi < Formula
  include Language::Python::Virtualenv

  desc "AI-powered code review and documentation quality tool"
  homepage "https://github.com/slb350/drep"
  url "https://files.pythonhosted.org/packages/79/1b/094f99e626a1d856be6094e6129a1f1bc91cd92841493a9988ced55f0694/drep_ai-0.8.2.tar.gz"
  sha256 "a8ae2c5ca206622de404757dbda1e1066c9fc94ba2cb980ccb0c1b1615dd6bcf"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "drep", shell_output("#{bin}/drep --version")
  end
end
