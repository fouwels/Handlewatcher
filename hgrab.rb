#!/usr/bin/env ruby
require 'net/http'
require 'uri'
require './apiKeys.rb'
require 'twilio-ruby'

def checkPage(handle)
  url = 'http://www.twitter.com/' + handle
  if !url.nil?
    puts 'checking: ' + url
    puts 'status -> ' + Net::HTTP.get_response(URI(url)).code      #Fine, 301 me then
  end
end

def pingUser(message)
  client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  resp = client.account.messages.create(:body => message, :to => STORED_NUMBER, :from => SOURCE_NUMBER)
  puts 'Pinged user' + resp.sid
end

checkPage('kfouwels')
pingUser('Yo')

puts 'END'