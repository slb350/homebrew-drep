class DrepAi < Formula
  include Language::Python::Virtualenv

  desc "AI-powered code review and documentation quality tool"
  homepage "https://github.com/slb350/drep"
  url "https://files.pythonhosted.org/packages/79/1b/094f99e626a1d856be6094e6129a1f1bc91cd92841493a9988ced55f0694/drep_ai-0.8.2.tar.gz"
  sha256 "a8ae2c5ca206622de404757dbda1e1066c9fc94ba2cb980ccb0c1b1615dd6bcf"
  license "MIT"

  depends_on "python@3.11"

  # Core dependencies - Homebrew will auto-resolve transitive dependencies
  resource "fastapi" do
    url "https://files.pythonhosted.org/packages/93/7f/d0e9a0bf5e323e9888d5e8c0e075593c127c296c21e14e7f7a1cc9ac4f1f/fastapi-0.115.6.tar.gz"
    sha256 "9ec46f7addc14ea472958a96aae5b5de65f39721a46aaf5705c480d9a8b76654"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/50/c1/0b0c87ba5f7036551bfb21348db9f4632e196cc81e8e864ce2d8e7c53dd2/uvicorn-0.34.0.tar.gz"
    sha256 "404051050cd7e905de2c9a7e61790943440b3416f49cb409f965d9dcd0fa73e9"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b/click-8.1.8.tar.gz"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/0e/d1/7a6006f1662ec56ba0749adde8f88f11d6c0026820c0c7e413ec4f361d7b/pydantic-2.10.5.tar.gz"
    sha256 "794e2c057d0a304e6df833a7eaca7a3c3b80085be65e6c3e45a8939fb806dd3e"
  end

  resource "sqlalchemy" do
    url "https://files.pythonhosted.org/packages/7c/c7/40c4b3a08bfb17d4246f8c089d6c0e1fae51ab6ee217f0e15b9e04a1e8c7/sqlalchemy-2.0.36.tar.gz"
    sha256 "7fddbe43684ac936c6832459df2d3ea26e29d45b51c4c349434c5c0f6d0b3a2a"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/cd/5c/e83870b32deb54e93e7df942d7ad46a68e5e23c82fe020f8e4a45c58359a/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "open-agent-sdk" do
    url "https://files.pythonhosted.org/packages/df/0b/c0ce4b0702ef43fe93d17b518d13c5ff5e846dba24290c3026974d1b9733/open_agent_sdk-0.4.1.tar.gz"
    sha256 "e22493faf1b38d64d114eff579283689430a16162e35d5e19c52b44607b5a22d"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  resource "gitpython" do
    url "https://files.pythonhosted.org/packages/a2/03/aa5f2c2c3af2c6d72aaef1652d58e7c1f67cd5de277c1c6f81fe30c82455/GitPython-3.1.43.tar.gz"
    sha256 "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
  end

  resource "boto3" do
    url "https://files.pythonhosted.org/packages/56/36/65d292d14261aedbb9a22e5bf194d84c119c889135b42448db646d06d76b/boto3-1.40.69.tar.gz"
    sha256 "5273f6bac347331a87db809dff97d8736c50c3be19f2bb36ad08c5131c408976"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "drep", shell_output("#{bin}/drep --version")
  end
end
