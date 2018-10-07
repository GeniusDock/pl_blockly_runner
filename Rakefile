
begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
rescue LoadError => e
  raise e unless ENV['RAILS_ENV'] == "production"
end
