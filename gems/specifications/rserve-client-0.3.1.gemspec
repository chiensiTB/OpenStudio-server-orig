# -*- encoding: utf-8 -*-
# stub: rserve-client 0.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rserve-client"
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Claudio Bustos"]
  s.date = "2013-07-26"
  s.description = "Ruby client for Rserve, a Binary R server (http://www.rforge.net/Rserve/).\n\nFollows closely the new Java client API, but maintains all Ruby conventions when possible."
  s.email = ["clbustos_AT_gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Introduction.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Introduction.txt", "Manifest.txt", "README.txt"]
  s.homepage = "http://github.com/clbustos/Rserve-Ruby-client"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.txt"]
  s.rubyforge_project = "ruby-statsample"
  s.rubygems_version = "2.4.8"
  s.summary = "Ruby client for Rserve, a Binary R server (http://www.rforge.net/Rserve/)"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.7"])
    else
      s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<rspec>, ["~> 2.0"])
      s.add_dependency(%q<hoe>, ["~> 3.7"])
    end
  else
    s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<rspec>, ["~> 2.0"])
    s.add_dependency(%q<hoe>, ["~> 3.7"])
  end
end
