require 'mechanize'
require 'w3c_mobile_ok/best_practice'
require 'w3c_mobile_ok/failure'
require 'w3c_mobile_ok/non_existent_resource_error'
require 'w3c_mobile_ok/parser'
require 'w3c_mobile_ok/resource'
require 'w3c_mobile_ok/result'
require 'w3c_mobile_ok/version'

module W3CMobileOk
  def self.parse(url)
    Parser.new(url).parse!
  end
end
