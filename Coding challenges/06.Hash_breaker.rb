require 'io/console'
require 'net/http'
require 'uri'
require 'digest'

cookie = "<your cookie here>"
uri = "http://ringzer0team.com/challenges/56/"

def url(uri, cookie, flag="")
	uri = URI(uri + flag)
	http = Net::HTTP.new(uri.host, 80)
	reqst = Net::HTTP::Get.new(uri.request_uri)
	reqst['cookie'] = cookie
	head = http.request(reqst)
	return head.body
end

body = url(uri, cookie)

regex = /----- BEGIN HASH -----<br \/>(.*)----- END HASH -----<br \/>/im
regex =~ body
data = Regexp.last_match(1)
data.gsub!(/\s|<br \/>/,"")

flag = ""
(1000..9999).each{|x| flag = x.to_s if data == Digest::SHA1.hexdigest(x.to_s)}

body = url(uri, cookie, flag)

regex = /FLAG.*<\/div>/
if regex.match(body) != nil
	flag = regex.match(body).to_s.gsub(/<\/div>/,"")
	print "Flag is: ", flag
else
	print "Wrong or too slow, try again!"
end