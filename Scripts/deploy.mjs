#!/usr/bin/env zx

const ROOT = "/Users/adelnizamutdinov/Projects/responsible/";
const CLI = path.join(ROOT, "cli");
const DIST = path.join(CLI, "dist");

const version = await within(async () => {
  cd(CLI);
  // await $`yarn deploy`;

  const vn = await $`jq -r .version package.json`;
  return vn.stdout.trim();
});

const sha256 = async (file) =>
  (await $`shasum -a 256 ${file}`).stdout.split(" ")[0].trim();

const x64SHA = await sha256(path.join(DIST, "responsible-x64"));
const armSHA = await sha256(path.join(DIST, "responsible-arm64"));

const formula = `class Responsible < Formula
  desc "Responsible DSL to OpenAPI transpiler"
  homepage "https://responsibleapi.com"
  version "${version}"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/responsibleapi/responsible/releases/download/v#{version}/responsible-arm64"
      sha256 "${armSHA}"
  
      def install
        bin.install "responsible-arm64" => "responsible"
      end
    end

    on_intel do
      url "https://github.com/responsibleapi/responsible/releases/download/v#{version}/responsible-x64"
      sha256 "${x64SHA}"
  
      def install
        bin.install "responsible-x64" => "responsible"
      end
    end
  end

  test do
    system "#{bin}/responsible", "--version"
  end
end
`;

const dir = (
  await $`brew --repository responsibleapi/responsible`
).stdout.trim();

await fs.writeFile(path.join(dir, "Formula", "responsible.rb"), formula);

await within(async () => {
  cd(dir);
  await $`git add .`;
  await $`git commit -m '${version}'`;
  await $`git push`;
});
