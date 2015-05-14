begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec do
  end
rescue LoadError
  puts "RSpec is not installed!"
end
