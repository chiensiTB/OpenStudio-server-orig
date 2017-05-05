# -*- encoding: utf-8 -*-
# stub: powerbar 1.0.18 ruby lib

Gem::Specification.new do |s|
  s.name = "powerbar"
  s.version = "1.0.18"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Moe"]
  s.date = "2016-12-25"
  s.description = "The last progressbar-library you'll ever need"
  s.email = ["moe@busyloop.net"]
  s.executables = ["powerbar-demo"]
  s.files = ["bin/powerbar-demo"]
  s.homepage = "https://github.com/busyloop/powerbar"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "The last progressbar-library you'll ever need"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hashie>, [">= 1.1.0"])
    else
      s.add_dependency(%q<hashie>, [">= 1.1.0"])
    end
  else
    s.add_dependency(%q<hashie>, [">= 1.1.0"])
  end
end
