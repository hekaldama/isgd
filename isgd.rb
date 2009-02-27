#!/usr/bin/env ruby

# Simple script to use is.gd api to generate a shortened URL

=begin

INSTALL:

  curl http://github.com/hekaldama/isgd/raw/master/isgd.rb > isgd &&
  sudo mv isgd /usr/local/bin/isgd

USE:

  Simple Usage
    isgd "http://www.url-to-shorten.com/"

=end


require 'open-uri'
require 'net/http'

module Isgd
  extend self

  def read(first_arg)
    return help if first_arg == '-h' || first_arg.nil? || first_arg[/help/]
    open(isgd_url + get_command_line_url).read
  end

  def isgd_url
    'http://is.gd/api.php?longurl='
  end

  def get_command_line_url
    ARGV.first.to_s
  end

  def help
    "USE:\n  " + File.read(__FILE__).match(/USE:(.+?)=end/m)[1].strip
  end

end

puts Isgd.read(ARGV.first)
