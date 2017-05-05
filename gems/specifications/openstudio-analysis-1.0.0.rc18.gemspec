# -*- encoding: utf-8 -*-
# stub: openstudio-analysis 1.0.0.rc18 ruby lib

Gem::Specification.new do |s|
  s.name = "openstudio-analysis"
  s.version = "1.0.0.rc18"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Nicholas Long"]
  s.date = "2017-03-07"
  s.description = "Basic classes for generating the files needed for OpenStudio-Server"
  s.email = ["Nicholas.Long@nrel.gov"]
  s.homepage = "http://openstudio.nrel.gov"
  s.licenses = ["LGPL"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0")
  s.rubygems_version = "2.4.8"
  s.summary = "Create JSON, ZIP to communicate with OpenStudio Distributed Analysis in the Cloud"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>, ["~> 0.8"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.6.8"])
      s.add_runtime_dependency(%q<roo>, ["~> 2.4"])
      s.add_runtime_dependency(%q<rubyzip>, ["~> 1.2"])
      s.add_runtime_dependency(%q<semantic>, ["~> 1.4"])
      s.add_runtime_dependency(%q<bcl>, ["~> 0.5.7"])
      s.add_runtime_dependency(%q<dencity>, ["~> 0.1.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.7"])
      s.add_development_dependency(%q<rake>, ["~> 11.1"])
    else
      s.add_dependency(%q<faraday>, ["~> 0.8"])
      s.add_dependency(%q<nokogiri>, ["~> 1.6.8"])
      s.add_dependency(%q<roo>, ["~> 2.4"])
      s.add_dependency(%q<rubyzip>, ["~> 1.2"])
      s.add_dependency(%q<semantic>, ["~> 1.4"])
      s.add_dependency(%q<bcl>, ["~> 0.5.7"])
      s.add_dependency(%q<dencity>, ["~> 0.1.0"])
      s.add_dependency(%q<bundler>, ["~> 1.7"])
      s.add_dependency(%q<rake>, ["~> 11.1"])
    end
  else
    s.add_dependency(%q<faraday>, ["~> 0.8"])
    s.add_dependency(%q<nokogiri>, ["~> 1.6.8"])
    s.add_dependency(%q<roo>, ["~> 2.4"])
    s.add_dependency(%q<rubyzip>, ["~> 1.2"])
    s.add_dependency(%q<semantic>, ["~> 1.4"])
    s.add_dependency(%q<bcl>, ["~> 0.5.7"])
    s.add_dependency(%q<dencity>, ["~> 0.1.0"])
    s.add_dependency(%q<bundler>, ["~> 1.7"])
    s.add_dependency(%q<rake>, ["~> 11.1"])
  end
end
