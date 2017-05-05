# -*- encoding: utf-8 -*-
# stub: rserve-simpler 0.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "rserve-simpler"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["John Prince"]
  s.date = "2012-02-04"
  s.description = "interface layered on top of rserve-client gem for interacting with R"
  s.email = "jtprince@gmail.com"
  s.extra_rdoc_files = ["LICENSE.txt", "README.rdoc"]
  s.files = ["LICENSE.txt", "README.rdoc"]
  s.homepage = "http://github.com/jtprince/rserve-simpler"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "simple interface for interacting with R through Rserve"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rserve-client>, ["~> 0.3.0"])
      s.add_development_dependency(%q<spec-more>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
    else
      s.add_dependency(%q<rserve-client>, ["~> 0.3.0"])
      s.add_dependency(%q<spec-more>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    end
  else
    s.add_dependency(%q<rserve-client>, ["~> 0.3.0"])
    s.add_dependency(%q<spec-more>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
  end
end
