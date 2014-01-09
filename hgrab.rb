#!/usr/bin/env ruby
require 'net/http'
require 'uri'

def checkPage(handle)
  url = 'http://www.twitter.com/' + handle
  if !url.nil?
    puts 'checking: ' + url
    puts 'status -> ' + Net::HTTP.get_response(URI(url)).code
  end
end

checkPage('kfouwels')
puts 'END'