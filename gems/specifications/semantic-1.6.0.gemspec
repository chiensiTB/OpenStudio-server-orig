# -*- encoding: utf-8 -*-
# stub: semantic 1.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "semantic"
  s.version = "1.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Josh Lindsey"]
  s.date = "2017-01-09"
  s.description = "Semantic Version utility class for parsing, storing, and comparing versions. See: http://semver.org"
  s.email = ["joshua.s.lindsey@gmail.com"]
  s.homepage = "https://github.com/jlindsey/semantic"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "Semantic Version utility class"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["~> 11"])
      s.add_development_dependency(%q<rspec>, ["~> 3"])
    else
      s.add_dependency(%q<rake>, ["~> 11"])
      s.add_dependency(%q<rspec>, ["~> 3"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 11"])
    s.add_dependency(%q<rspec>, ["~> 3"])
  end
end
