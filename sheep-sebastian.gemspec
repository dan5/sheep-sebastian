# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sheep-sebastian/version"

Gem::Specification.new do |s|
  s.name        = "sheep-sebastian"
  s.version     = Sheep::Sebastian::VERSION
  s.authors     = ["dan5ya"]
  s.email       = ["dan5.ya@gmail.com"]
  s.homepage    = "https://github.com/dan5/sheep-sebastion"
  s.summary     = %q{todo}
  s.description = %q{todo...}

  s.rubyforge_project = "sheep-sebastian"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
