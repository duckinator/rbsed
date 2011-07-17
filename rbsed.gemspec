# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rbsed/version"

Gem::Specification.new do |s|
  s.name        = "rbsed"
  s.version     = RBSed::VERSION
  s.authors     = ["Nick Markwell"]
  s.email       = ["nick@duckinator.net"]
  s.homepage    = "https://github.com/duckinator/rbsed"
  s.summary     = %q{Provides str.sed('s/a/b/flags') and similar.}
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
