class Responsible < Formula
  desc "Responsible DSL to OpenAPI transpiler"
  homepage "https://responsibleapi.com"
  version "0.1.2"
  license "MIT"

  on_arm do
    url "https://github.com/responsibleapi/responsible/releases/download/v#{version}/responsible-arm64"
    sha256 "f2c3d7fb9934b9f4f2576ac3d8e4f48f1f178fc6eb1ade4557ad03a82f4f6ef6"

    def install
      bin.install "responsible-arm64" => "responsible"
    end
  end

  on_intel do
    url "https://github.com/responsibleapi/responsible/releases/download/v#{version}/responsible-x64"
    sha256 "16ac574149cb7800dc841a8d198fd0d6cd959f65a8a1a00fc35001be87b8324d"

    def install
      bin.install "responsible-x64" => "responsible"
    end
  end

  test do
    system "#{bin}/responsible", "--version"
  end
end
