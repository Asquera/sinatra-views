# encoding: utf-8

Gem::Specification.new do |s|
  s.name = "sinatra-views"
  s.version = "0.4.1"
  s.authors = ["Florian Gilcher"]
  s.email = "florian.gilcher@asquera.de"
  s.homepage = "http://github.com/Asquera/sinatra-views"
  s.summary = "Sinatra Plugin to provide a View layer to Sinatra."
  s.description = <<-DESC 
  Sinatra Plugin to provide a View layer to Sinatra.
  DESC

  s.files = Dir['**/{sinatra/*,sinatra,test_helper.rb}'] + %w(README.md sinatra-views.gemspec Rakefile LICENSE)
  s.platform = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.add_dependency('sinatra', '>= 1.0')
end
