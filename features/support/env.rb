require 'rspec-expectations'
require 'page-object'
require 'nokogiri'
require 'rspec/matchers'
require 'date'
require 'yaml'

#local libs
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'env_config'
require 'time'

World(PageObject::PageFactory)

def wait_for_ajax
  Timeout.timeout(15) { sleep(0.1) until @browser.execute_script("jQuery.active") == 0 }
end
