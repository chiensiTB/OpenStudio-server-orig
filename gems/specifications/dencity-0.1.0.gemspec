# -*- encoding: utf-8 -*-
# stub: dencity 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "dencity"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "TODO: Set to 'http://mygemserver.com'" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["kflemin", "nlong"]
  s.bindir = "exe"
  s.date = "2016-01-29"
  s.email = ["katherine.fleming@nrel.gov"]
  s.homepage = "https://github.com/NREL/dencity-gem"
  s.rubygems_version = "2.4.8"
  s.summary = "Client library for DEnCity.org."

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.10"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_runtime_dependency(%q<faraday>, [">= 0"])
      s.add_runtime_dependency(%q<faraday_middleware>, [">= 0"])
      s.add_runtime_dependency(%q<multi_json>, [">= 0"])
      s.add_runtime_dependency(%q<parallel>, [">= 0"])
      s.add_runtime_dependency(%q<hashie>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.10"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<faraday>, [">= 0"])
      s.add_dependency(%q<faraday_middleware>, [">= 0"])
      s.add_dependency(%q<multi_json>, [">= 0"])
      s.add_dependency(%q<parallel>, [">= 0"])
      s.add_dependency(%q<hashie>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.10"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<faraday>, [">= 0"])
    s.add_dependency(%q<faraday_middleware>, [">= 0"])
    s.add_dependency(%q<multi_json>, [">= 0"])
    s.add_dependency(%q<parallel>, [">= 0"])
    s.add_dependency(%q<hashie>, [">= 0"])
  end
end
