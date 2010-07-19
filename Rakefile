desc 'Default task: run all tests'
task :default => [:test]

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = false
  test.warning = false 
  test.ruby_opts = ['-rubygems', '-rtest_helper']
end
