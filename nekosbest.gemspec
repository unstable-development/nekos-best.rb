# frozen_string_literal: true

require_relative "lib/nekosbest/version"

Gem::Specification.new do |spec|
  spec.name = "nekosbest"
  spec.version = Nekosbest::VERSION
  spec.authors = ["unstable-development"]
  spec.email = ["83883849+NekoFanatic@users.noreply.github.com"]

  spec.summary = "A simple ruby wrapper for the nekos.best API https://nekos.best/."
  spec.homepage = "https://github.com/unstable-development/nekos-best.rb"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/unstable-development/nekos-best.rb"
  spec.metadata["changelog_uri"] = "https://github.com/unstable-development/nekos-best.rb/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.20.0"

end
