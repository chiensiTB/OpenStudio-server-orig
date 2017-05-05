# -*- encoding: utf-8 -*-
# stub: minitar-cli 0.6.1 ruby lib

Gem::Specification.new do |s|
  s.name = "minitar-cli"
  s.version = "0.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Austin Ziegler"]
  s.date = "2017-02-08"
  s.description = "<tt>minitar-cli</tt> is a pure-Ruby command-line tool that uses\n{minitar}[https://github.com/halostatue/minitar] to provide a command-line\ntool, +minitar+, for working with POSIX tar(1) archive files.\n\nThis is release 0.6, extracted from {minitar}[https://halostatue.ca/minitar],\nwith modernizations."
  s.email = ["halostatue@gmail.com"]
  s.executables = ["minitar"]
  s.extra_rdoc_files = ["Contributing.md", "History.md", "Licence.md", "Manifest.txt", "README.rdoc", "docs/bsdl.txt", "docs/ruby.txt"]
  s.files = ["Contributing.md", "History.md", "Licence.md", "Manifest.txt", "README.rdoc", "bin/minitar", "docs/bsdl.txt", "docs/ruby.txt"]
  s.homepage = "https://github.com/halostatue/minitar-cli/"
  s.licenses = ["Ruby", "BSD-2-Clause"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8")
  s.rubygems_version = "2.4.8"
  s.summary = "<tt>minitar-cli</tt> is a pure-Ruby command-line tool that uses {minitar}[https://github.com/halostatue/minitar] to provide a command-line tool, +minitar+, for working with POSIX tar(1) archive files"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitar>, ["~> 0.6.0"])
      s.add_runtime_dependency(%q<powerbar>, ["~> 1.0"])
      s.add_development_dependency(%q<minitest>, ["~> 5.10"])
      s.add_development_dependency(%q<hoe-doofus>, ["~> 1.0"])
      s.add_development_dependency(%q<hoe-gemspec2>, ["~> 1.1"])
      s.add_development_dependency(%q<hoe-git>, ["~> 1.6"])
      s.add_development_dependency(%q<hoe-rubygems>, ["~> 1.0"])
      s.add_development_dependency(%q<hoe-travis>, ["~> 1.2"])
      s.add_development_dependency(%q<minitest-autotest>, ["< 2", ">= 1.0"])
      s.add_development_dependency(%q<rake>, ["< 12", ">= 10.0"])
      s.add_development_dependency(%q<rdoc>, [">= 0.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.16"])
    else
      s.add_dependency(%q<minitar>, ["~> 0.6.0"])
      s.add_dependency(%q<powerbar>, ["~> 1.0"])
      s.add_dependency(%q<minitest>, ["~> 5.10"])
      s.add_dependency(%q<hoe-doofus>, ["~> 1.0"])
      s.add_dependency(%q<hoe-gemspec2>, ["~> 1.1"])
      s.add_dependency(%q<hoe-git>, ["~> 1.6"])
      s.add_dependency(%q<hoe-rubygems>, ["~> 1.0"])
      s.add_dependency(%q<hoe-travis>, ["~> 1.2"])
      s.add_dependency(%q<minitest-autotest>, ["< 2", ">= 1.0"])
      s.add_dependency(%q<rake>, ["< 12", ">= 10.0"])
      s.add_dependency(%q<rdoc>, [">= 0.0"])
      s.add_dependency(%q<hoe>, ["~> 3.16"])
    end
  else
    s.add_dependency(%q<minitar>, ["~> 0.6.0"])
    s.add_dependency(%q<powerbar>, ["~> 1.0"])
    s.add_dependency(%q<minitest>, ["~> 5.10"])
    s.add_dependency(%q<hoe-doofus>, ["~> 1.0"])
    s.add_dependency(%q<hoe-gemspec2>, ["~> 1.1"])
    s.add_dependency(%q<hoe-git>, ["~> 1.6"])
    s.add_dependency(%q<hoe-rubygems>, ["~> 1.0"])
    s.add_dependency(%q<hoe-travis>, ["~> 1.2"])
    s.add_dependency(%q<minitest-autotest>, ["< 2", ">= 1.0"])
    s.add_dependency(%q<rake>, ["< 12", ">= 10.0"])
    s.add_dependency(%q<rdoc>, [">= 0.0"])
    s.add_dependency(%q<hoe>, ["~> 3.16"])
  end
end
