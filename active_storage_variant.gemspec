require_relative 'lib/active_storage_variant/version'

Gem::Specification.new do |s|
  s.name          = "active_storage_variant"
  s.version       = ActiveStorageVariant::VERSION
  s.authors       = ["Yi Feng Xie"]
  s.email         = ["yfxie@me.com"]

  s.summary       = %q{Use the pre-defined variants feature in Rails 6 projects.}
  s.description   = %q{The pre-defined variants feature is introduced in Rails 7. Using this gem, take the feature in advance for projects using Rails 6.}
  s.homepage      = "https://github.com/yfxie/active_storage_variant/"
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0")


  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = s.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  s.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 6.0"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry"
  s.add_development_dependency "image_processing"
  s.add_development_dependency "appraisal"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "codecov"
end
