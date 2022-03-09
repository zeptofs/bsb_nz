# frozen_string_literal: true

require_relative "lib/bsb_nz/version"

Gem::Specification.new do |spec|
  spec.name = "bsb_nz"
  spec.version = BsbNz::VERSION
  spec.authors = ["Wei Zeng"]
  spec.email = ["gzzengwei@gmail.com"]

  spec.summary = "BSB code for New Zealand"
  spec.description = "BSB code for New Zealand genrated from paymentsnz.co.nz"
  spec.homepage = "https://github.com/zeptofs/bsb_nz"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "gem server 'https://github.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/zeptofs/bsb_nz"
  spec.metadata["changelog_uri"] = "https://github.com/zeptofs/bsb_nz/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rest-client"
  spec.add_dependency "activemodel"
end
