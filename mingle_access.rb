require "logger"
require "net/https"

require File.expand_path(File.join(File.dirname(__FILE__), "lib", "http_error"))
require File.expand_path(File.join(File.dirname(__FILE__), "lib", "basic_auth"))

module MingleAccess
  
  attr_accessor :log
  module_function :log, :log=
  self.log = Logger.new(STDOUT)
  self.log.level = Logger::INFO

end