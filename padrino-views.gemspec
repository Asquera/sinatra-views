# encoding: utf-8

require 'lib/version'

Gem::Specification.new do |s|
  s.name = "padrino-views"
  s.version = 0.4
  s.authors = ["Florian Gilcher"]
  s.email = "florian.gilcher@asquera.de"
  s.homepage = "http://github.com/Asquera/sinatra-views"
  s.summary = "Padrino Plugin to provide a View layer to Padrino."
  s.description = <<-DESC 
  Padriono Plugin to provide a View layer to Padrino.
  DESC

  s.files = Dir['**/{sinatra/*,sinatra,test_helper.rb}'] + Dir['**/{padrino/*,padrino}'] + %w(README.md padrino-views.gemspec Rakefile LICENSE)
  s.platform = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.add_dependency('padrino', '>= 0.9.14')
end
