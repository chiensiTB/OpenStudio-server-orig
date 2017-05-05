# -*- encoding: utf-8 -*-
# stub: delayed_job_mongoid 2.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "delayed_job_mongoid"
  s.version = "2.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Chris Gaffney", "Brandon Keepers", "Erik Michaels-Ober"]
  s.date = "2017-02-13"
  s.email = ["chris@collectiveidea.com", "brandon@opensoul.com", "sferik@gmail.com"]
  s.homepage = "http://github.com/collectiveidea/delayed_job_mongoid"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "Mongoid backend for delayed_job"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<delayed_job>, ["< 5", ">= 3.0"])
      s.add_runtime_dependency(%q<mongoid>, ["< 7", ">= 3.0"])
      s.add_runtime_dependency(%q<mongoid-compatibility>, [">= 0.4.0"])
    else
      s.add_dependency(%q<delayed_job>, ["< 5", ">= 3.0"])
      s.add_dependency(%q<mongoid>, ["< 7", ">= 3.0"])
      s.add_dependency(%q<mongoid-compatibility>, [">= 0.4.0"])
    end
  else
    s.add_dependency(%q<delayed_job>, ["< 5", ">= 3.0"])
    s.add_dependency(%q<mongoid>, ["< 7", ">= 3.0"])
    s.add_dependency(%q<mongoid-compatibility>, [">= 0.4.0"])
  end
end
