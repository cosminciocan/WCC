require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  system "bundle install"
  t.profile = 'default'
  t.cucumber_opts = "--format html --out results/test_report_demo.html --format rerun --out results/rerun.txt"
end

Cucumber::Rake::Task.new(:rerun, "Rerun failed scenarios from 'progress'` rake task`") do |t|
  t.profile = 'default'
  t.cucumber_opts = "@results/rerun.txt -r features"
end

task :default => :features

namespace :cuke do
  profiles = YAML::load(File.open(File.join(Dir.pwd, 'cucumber.yml'))).keys
  profiles.each do |profile|
    Cucumber::Rake::Task.new(profile.to_sym) do |t|
      t.profile = profile
    end
  end
end

task :help do |t|
  message = <<-MESSAGE
Optional flags:
  CONFIG=ci, ft, uat, rc
  BROWSER=firefox (default), chrome, ie
  JUNIT_OUTPUT= Select some directory
  MESSAGE
  puts message
end
