require 'rubygems'

Gem::Specification.new do |spec|
  spec.name       = 'sys-filesystem'
  spec.version    = '1.1.7'
  spec.author     = 'Daniel J. Berger'
  spec.email      = 'djberg96@gmail.com'
  spec.homepage   = 'https://github.com/djberg96/sys-filesystem'
  spec.summary    = 'A Ruby interface for getting file system information.'
  spec.test_file  = 'test/test_sys_filesystem.rb'
  spec.license    = 'Artistic 2.0'
  spec.files      = Dir['**/*'].reject{ |f| f.include?('git') }
  spec.cert_chain = Dir['certs/*']
   
  spec.extra_rdoc_files  = ['CHANGES', 'README', 'MANIFEST']

  spec.add_dependency('ffi')
  spec.add_development_dependency('test-unit', '>= 2.5.0')
  spec.add_development_dependency('rake')

  spec.description = <<-EOF
    The sys-filesystem library provides a cross-platform interface for
    gathering filesystem information, such as disk space and mount point data.
  EOF
end
