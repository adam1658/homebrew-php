class Phan < Formula
  desc "Static analyzer for PHP"
  homepage "https://github.com/etsy/phan"
  url "https://github.com/etsy/phan/archive/0.2.tar.gz"
  sha256 "fe3871aa96fae79323a635e6ca34f129bf2176ebf2664e81f1be7056841c3b01"
  head "https://github.com/etsy/phan.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "7aa2af6fec5dfcc403dba3dd94f385491281781addfc40d4500cc21c35d4a92d" => :el_capitan
    sha256 "6cc25f87be942737994df42d1c68070e50ec7779d100e22e2090bfe13866ba13" => :yosemite
    sha256 "f538e9d9a64cddd8b2ac8d86daf9fcad5f7620c964c97b3bf6e507da264a3b61" => :mavericks
  end

  depends_on "composer"
  depends_on "php70-ast"
  depends_on "php70"

  def install
    system "composer", "install"
    prefix.install Dir["*"]
    bin.install_symlink prefix/"phan"
  end

  test do
    system "phan", "--version"
  end
end
