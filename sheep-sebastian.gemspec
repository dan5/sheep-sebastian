# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sheep-sebastian/version"

Gem::Specification.new do |s|
  s.name        = "sheep-sebastian"
  s.version     = Sheep::Sebastian::VERSION
  s.authors     = ["dan5"]
  s.email       = ["dan5.ya@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "sheep-sebastian"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
