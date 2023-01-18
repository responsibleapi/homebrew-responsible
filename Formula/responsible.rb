class Responsible < Formula
  desc "Responsible DSL to OpenAPI transpiler"
  homepage "https://responsibleapi.com"
  version "0.1.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/responsibleapi/responsible/releases/download/v#{version}/responsible-arm64"
      sha256 "bec60175858d25af10ddca81ae53a4595fe1dc86ea1b648576b09912d8e7e848"
  
      def install
        bin.install "responsible-arm64" => "responsible"
      end
    end

    on_intel do
      url "https://github.com/responsibleapi/responsible/releases/download/v#{version}/responsible-x64"
      sha256 "59cefbb6e9413e337d39eff6e545479e4b7fb20af3fc2303b2f0ad8c5e97888c"
  
      def install
        bin.install "responsible-x64" => "responsible"
      end
    end
  end

  test do
    system "#{bin}/responsible", "--version"
  end
end
