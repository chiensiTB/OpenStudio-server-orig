# -*- encoding: utf-8 -*-
# stub: libxml-ruby 3.0.0 ruby lib
# stub: ext/libxml/extconf.rb

Gem::Specification.new do |s|
  s.name = "libxml-ruby"
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ross Bamform", "Wai-Sun Chia", "Sean Chittenden", "Dan Janwoski", "Anurag Priyam", "Charlie Savage", "Ryan Johnson"]
  s.date = "2017-02-10"
  s.description = "    The Libxml-Ruby project provides Ruby language bindings for the GNOME\n    Libxml2 XML toolkit. It is free software, released under the MIT License.\n    Libxml-ruby's primary advantage over REXML is performance - if speed\n    is your need, these are good libraries to consider, as demonstrated\n    by the informal benchmark below.\n"
  s.extensions = ["ext/libxml/extconf.rb"]
  s.files = ["ext/libxml/extconf.rb"]
  s.homepage = "http://xml4r.github.com/libxml-ruby"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.6")
  s.rubygems_version = "2.4.8"
  s.summary = "Ruby Bindings for LibXML2"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hanna_guado>, [">= 0"])
      s.add_development_dependency(%q<rake-compiler>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
    else
      s.add_dependency(%q<hanna_guado>, [">= 0"])
      s.add_dependency(%q<rake-compiler>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
    end
  else
    s.add_dependency(%q<hanna_guado>, [">= 0"])
    s.add_dependency(%q<rake-compiler>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
  end
end
