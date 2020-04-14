$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "alchemy/crop/image/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "alchemy-crop-image"
  spec.version     = Alchemy::Crop::Image::VERSION
  spec.authors     = ["Alessandro Baccanelli"]
  spec.email       = ["alessandro.baccanelli@archimedianet.it"]
  spec.homepage    = ""
  spec.summary     = "A gem for enable image cropping in Alchemy Library"
  spec.description = "With this gem you can crop and resize images directly in Alchemy Library and create a new verison of image"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.2", ">= 6.0.2.2"
  spec.add_dependency "alchemy_cms", "~> 4.5"
  spec.add_dependency "webpacker", "~> 5.0", ">= 5.0.1"

  spec.add_development_dependency "sqlite3"
end
