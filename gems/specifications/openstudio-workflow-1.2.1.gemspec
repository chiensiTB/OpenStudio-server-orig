# -*- encoding: utf-8 -*-
# stub: openstudio-workflow 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "openstudio-workflow"
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Nicholas Long", "Henry Horsey"]
  s.date = "2017-03-28"
  s.description = "Run OpenStudio based measures and simulations using EnergyPlus"
  s.email = ["nicholas.long@nrel.gov", "henry.horsey@nrel.gov"]
  s.homepage = "https://github.com/NREL/OpenStudio-workflow-gem"
  s.licenses = ["LGPL"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0")
  s.rubygems_version = "2.4.8"
  s.summary = "OpenStudio Workflow Manager"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<json-schema>, ["~> 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<json-schema>, ["~> 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<json-schema>, ["~> 0"])
  end
end
