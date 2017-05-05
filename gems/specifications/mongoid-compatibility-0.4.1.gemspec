# -*- encoding: utf-8 -*-
# stub: mongoid-compatibility 0.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "mongoid-compatibility"
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Daniel Doubrovkine"]
  s.date = "2017-01-19"
  s.email = "dblock@dblock.org"
  s.homepage = "http://github.com/mongoid/mongoid-compatibility"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "Compatibility helpers for Mongoid."

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongoid>, [">= 2.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<mongoid>, [">= 2.0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<mongoid>, [">= 2.0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end
