# -*- encoding: utf-8 -*-
# stub: openstudio-aws 0.5.0.rc8 ruby lib

Gem::Specification.new do |s|
  s.name = "openstudio-aws"
  s.version = "0.5.0.rc8"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Nicholas Long"]
  s.date = "2017-03-21"
  s.description = "Custom classes for configuring clusters for OpenStudio & EnergyPlus analyses"
  s.email = ["Nicholas.Long@nrel.gov"]
  s.homepage = "http://openstudio.nrel.gov"
  s.licenses = ["LGPL"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.4.8"
  s.summary = "Start AWS EC2 instances for running distributed OpenStudio-based analyses"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<net-scp>, ["~> 1.1"])
      s.add_runtime_dependency(%q<net-ssh>, ["= 3.0.2"])
      s.add_runtime_dependency(%q<aws-sdk-core>, ["= 2.2.26"])
      s.add_runtime_dependency(%q<semantic>, ["~> 1.4"])
      s.add_runtime_dependency(%q<sshkey>, ["~> 1.7"])
      s.add_development_dependency(%q<rake>, ["~> 10.4"])
    else
      s.add_dependency(%q<net-scp>, ["~> 1.1"])
      s.add_dependency(%q<net-ssh>, ["= 3.0.2"])
      s.add_dependency(%q<aws-sdk-core>, ["= 2.2.26"])
      s.add_dependency(%q<semantic>, ["~> 1.4"])
      s.add_dependency(%q<sshkey>, ["~> 1.7"])
      s.add_dependency(%q<rake>, ["~> 10.4"])
    end
  else
    s.add_dependency(%q<net-scp>, ["~> 1.1"])
    s.add_dependency(%q<net-ssh>, ["= 3.0.2"])
    s.add_dependency(%q<aws-sdk-core>, ["= 2.2.26"])
    s.add_dependency(%q<semantic>, ["~> 1.4"])
    s.add_dependency(%q<sshkey>, ["~> 1.7"])
    s.add_dependency(%q<rake>, ["~> 10.4"])
  end
end
