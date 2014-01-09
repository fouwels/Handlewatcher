#!/usr/bin/env ruby
require 'uri'
require 'twilio-ruby'
require 'httparty'
require './apiKeys.rb'

def checkPage(handle)
  url = 'http://www.twitter.com/' + handle
  if !url.nil?
    puts 'checking: ' + url
    puts 'status -> ' + HTTParty.get('http://www.example.com/', :headers => {'User-Agent' => 'HTTParty'}).code.to_s
  end
end

def pingUser(message)
  client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  resp = client.account.messages.create(:body => message, :to => STORED_NUMBER, :from => SOURCE_NUMBER)
  puts 'Pinged user' + resp.sid
end

checkPage('kfouwels')
#pingUser('Yo')

puts 'END'