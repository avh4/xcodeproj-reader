$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module XcodeprojReader
  VERSION = '0.0.1'
end

require 'xcodeproj-reader/reader'

require 'rubygems'
require 'treetop'
Treetop.load File.dirname(__FILE__) + "/xcodeproj-reader/pbxproj.treetop"
