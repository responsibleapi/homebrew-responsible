class Responsible < Formula
  desc "Responsible DSL to OpenAPI transpiler"
  homepage "https://responsibleapi.com"
  version "0.1.2"
  license "MIT"

  on_arm do
    url "https://github.com/responsibleapi/responsible/releases/download/v#{version}/responsible-arm64"
    sha256 "62601829a8eb169f3e8aece1178ac2145bbc657c861b1d989ad4be7d9d60446c"
  end

  on_intel do
    url "https://github.com/responsibleapi/responsible/releases/download/v#{version}/responsible-x64"
    sha256 "502fed5c9c926cd580136465adab4dbd058598067c8daba620568dc3147bb329"
  end

  def install
    bin.install "responsible"
  end

  test do
    system "#{bin}/responsible", "--version"
  end
end
