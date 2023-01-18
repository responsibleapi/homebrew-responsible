class Responsible < Formula
  desc "Responsible DSL to OpenAPI transpiler"
  homepage "https://responsibleapi.com"
  version "0.1.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/responsibleapi/responsible/releases/download/v#{version}/responsible-arm64"
      sha256 "b268129b75957286da1b1cc5c756e5bac9feaa6e68e93fc1ccc26278137ac590"
  
      def install
        bin.install "responsible-arm64" => "responsible"
      end
    end

    on_intel do
      url "https://github.com/responsibleapi/responsible/releases/download/v#{version}/responsible-x64"
      sha256 "0d52f280e6b3e156c19896d29ba097dfbef4d62425cc951906e48a3ee8861c0b"
  
      def install
        bin.install "responsible-x64" => "responsible"
      end
    end
  end

  test do
    system "#{bin}/responsible", "--version"
  end
end
