#!/usr/bin/env ruby
require 'uri'
require 'twilio-ruby'
require 'httparty'
require './apiKeys.rb'

def quickCheckPage(handle)
  url = 'http://www.twitter.com/' + handle
  if !url.nil?
    puts 'checking: ' + url
    puts 'status -> ' + HTTParty.get('http://www.example.com/', :headers => {'User-Agent' => 'test'}).code.to_s
  end
end

def checkPage(handle)
  url = 'http://www.twitter.com/' + handle
  if !url.nil?
    puts 'checking: ' + url
    uri = URI(url)
    http = Net::HTTP.new(uri.host, 443)
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri.request_uri)
    req['User-Agent'] = 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0'
    puts http.request(req).code
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