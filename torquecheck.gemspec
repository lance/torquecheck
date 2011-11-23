# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{torquecheck}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lance Ball"]
  s.date = %q{2011-11-23}
  s.default_executable = %q{torquecheck}
  s.description = %q{TorqueCheck - A utility for displaying information about your TorqueBox installation.}
  s.email = %q{lball@redhat.com}
  s.executables = ["torquecheck"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README"
  ]
  s.files = [
    "LICENSE",
    "README",
    "lib/torquebox/bundler.rb",
    "lib/torquebox/environment.rb",
    "lib/torquebox/gem.rb",
    "lib/torquebox/ruby.rb",
    "lib/torquebox/server.rb",
    "bin/torquecheck"
  ]
  s.homepage = %q{http://github.com/lance/torquecheck}
  s.licenses = ["GNU LPGL"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.1}
  s.summary = %q{A utility for displaying information about your TorqueBox installation.}

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end
end

