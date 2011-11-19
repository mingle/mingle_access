# -*- encoding: utf-8 -*-
require 'rake'

Gem::Specification.new do |s|
  s.name = %q{mingle_access}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Rice"]
  s.date = %q{2011-11-18}
  s.description = %q{
    I'm sick of hacking the same HTTP/S and OAuth code every time I write a Mingle integration!!
  }
  s.email = %q{david.rice at gmail dot com}
  s.extra_rdoc_files = ["LICENSE.txt", "README.md"]
  s.files = FileList[
    "lib/**/*.rb",
    "LICENSE.txt",
    "README.md",
  ].to_a
  s.homepage = %q{https://github.com/ThoughtWorksStudios/mingle_access}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "mingle_events", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{mingle_access}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A gem that lets you access the Mingle API without worrying about the Net:HTTP nonsense.}
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
