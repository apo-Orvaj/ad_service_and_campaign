# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ad_service_and_campaign/version"

Gem::Specification.new do |spec|
  spec.name          = "ad_service_and_campaign"
  spec.version       = AdServiceAndCampaign::VERSION
  spec.authors       = ["Apoorva Jain"]
  spec.email         = ["apoorva.jain3293@gmail.com"]

  spec.summary       = "ad_service_and_campaign"
  spec.description   = "ad_service_and_campaign"
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.files << "lib/ad_service.rb"
  spec.files << "lib/campaign.rb"
  spec.files.delete("ad_service_and_campaign-0.1.0.gem")
  
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
