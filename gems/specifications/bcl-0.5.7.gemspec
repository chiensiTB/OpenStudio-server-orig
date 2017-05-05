# -*- encoding: utf-8 -*-
# stub: bcl 0.5.7 ruby lib

Gem::Specification.new do |s|
  s.name = "bcl"
  s.version = "0.5.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Daniel Macumber", "Nicholas Long", "Andrew Parker", "Katherine Fleming"]
  s.date = "2016-11-03"
  s.description = "This gem contains helper methods for generating the Component XML file needed to upload files to the Building Component Library. It also contains the classes needed for logging in via the api and uploading generating components"
  s.email = "Nicholas.Long@nrel.gov"
  s.homepage = "http://bcl.nrel.gov"
  s.licenses = ["LGPL"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.4.8"
  s.summary = "Classes for creating component XML files for the BCL"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<uuid>, [">= 0"])
      s.add_runtime_dependency(%q<builder>, [">= 0"])
      s.add_runtime_dependency(%q<zliby>, [">= 0"])
      s.add_runtime_dependency(%q<archive-tar-minitar>, [">= 0"])
      s.add_runtime_dependency(%q<multi_json>, [">= 0"])
      s.add_runtime_dependency(%q<yamler>, [">= 0"])
      s.add_runtime_dependency(%q<faraday>, [">= 0"])
      s.add_runtime_dependency(%q<roo>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<rubyzip>, [">= 0"])
      s.add_runtime_dependency(%q<rubyXL>, [">= 0"])
    else
      s.add_dependency(%q<uuid>, [">= 0"])
      s.add_dependency(%q<builder>, [">= 0"])
      s.add_dependency(%q<zliby>, [">= 0"])
      s.add_dependency(%q<archive-tar-minitar>, [">= 0"])
      s.add_dependency(%q<multi_json>, [">= 0"])
      s.add_dependency(%q<yamler>, [">= 0"])
      s.add_dependency(%q<faraday>, [">= 0"])
      s.add_dependency(%q<roo>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<rubyzip>, [">= 0"])
      s.add_dependency(%q<rubyXL>, [">= 0"])
    end
  else
    s.add_dependency(%q<uuid>, [">= 0"])
    s.add_dependency(%q<builder>, [">= 0"])
    s.add_dependency(%q<zliby>, [">= 0"])
    s.add_dependency(%q<archive-tar-minitar>, [">= 0"])
    s.add_dependency(%q<multi_json>, [">= 0"])
    s.add_dependency(%q<yamler>, [">= 0"])
    s.add_dependency(%q<faraday>, [">= 0"])
    s.add_dependency(%q<roo>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<rubyzip>, [">= 0"])
    s.add_dependency(%q<rubyXL>, [">= 0"])
  end
end
