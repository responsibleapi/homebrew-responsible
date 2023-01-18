class Responsible < Formula
  desc "Responsible DSL to OpenAPI transpiler"
  homepage "https://responsibleapi.com"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/responsibleapi/responsible/releases/download/v#{version}/responsible-arm64"
      sha256 "af24394b77deaa7be0d464b2b7c78bd002c3b08b1f8423105a4f773390566adc"
  
      def install
        bin.install "responsible-arm64" => "responsible"
      end
    end

    on_intel do
      url "https://github.com/responsibleapi/responsible/releases/download/v#{version}/responsible-x64"
      sha256 "c0b97ed38fe4a6144a65a04968e0e256abe57473c50d22740b0026061a945c08"
  
      def install
        bin.install "responsible-x64" => "responsible"
      end
    end
  end

  test do
    system "#{bin}/responsible", "--version"
  end
end
