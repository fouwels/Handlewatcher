#!/usr/bin/env ruby
require 'uri'
require 'twilio-ruby'
require 'net/http'
require 'httparty'
require './apiKeys.rb'

#def checkPage(handle)      #https? #user-agent? # No - still going to give me a 301...
#  url = 'https://www.twitter.com/' + handle
#  if !url.nil?
#    puts 'checking: ' + url
#    uri = URI(url)
#    http = Net::HTTP.new(uri.host, 443)      #WORST. HTTP. CLASS. EVA.
#    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
#    http.use_ssl = true
#    req = Net::HTTP::Get.new(uri.request_uri)
#    req['User-Agent'] = 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0'
#    puts http.request(req).code
#    return http.request(req).code
#  end
#end

def partyCheckPage(handle)
  url = 'http://www.twitter.com/' + handle + '/'
  if !url.nil?
    puts 'checking: ' + url
    status = HTTParty.get(url , :headers => {'User-Agent' => 'test'}).code.to_s
    puts 'status -> ' + status
    return status
  end
end

def pingUser(message)
  client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  resp = client.account.messages.create(:body => message, :to => STORED_NUMBER, :from => SOURCE_NUMBER)
  puts 'Pinged user' + resp.sid
end

if partyCheckPage('kfouwels') == 200
  pingUser('Handle seems to be available')
end

puts 'END'