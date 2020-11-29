$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "alchemy/crop/image/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "alchemy-crop-image"
  spec.version     = Alchemy::Crop::Image::VERSION
  spec.authors     = ["Alessandro Baccanelli"]
  spec.email       = ["alessandro.baccanelli@archimedianet.it"]
  spec.homepage    = "https://github.com/ArchimediaZerogroup/alchemy-crop-image"
  spec.summary     = "A gem for enable image cropping in Alchemy Library"
  spec.description = "With this gem you can crop and resize images directly in Alchemy Library and create a new verison of image"
  spec.license     = "MIT"

  spec.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir      = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end



  spec.add_dependency "rails", ">= 5.2.0", "< 7.0.0"
  spec.add_dependency "alchemy_cms",">= 4.1"
  spec.add_dependency "sprockets-rails", "3.2.1"
  spec.add_dependency 'js-routes', '~> 1.4', '>= 1.4.9'

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency 'alchemy-devise', '~> 4.5'
  spec.add_development_dependency 'puma', '~> 3.11'
  spec.add_development_dependency 'webpacker', '~> 4.0'
end
