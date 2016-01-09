require "rake/testtask"

task :default => :test

desc "Run all tests"
Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/**/test_*.rb']
end
