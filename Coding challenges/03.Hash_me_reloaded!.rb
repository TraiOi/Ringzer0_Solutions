require 'net/http'
require 'uri'
require 'digest'

uri = "http://ringzer0team.com/challenges/14/"
cookie = "<your cookie here>"

def url(uri, cookie, flag="")
	uri = URI(uri + flag)
	http = Net::HTTP.new(uri.host, 80)
	request = Net::HTTP::Get.new(uri.request_uri)
	request['cookie'] = cookie
	r = http.request(request)
	return r.body
end

body = url(uri, cookie)
regex = /----- BEGIN MESSAGE -----<br \/>(.*)----- END MESSAGE -----<br \/>/im
regex =~ body
data = Regexp.last_match(1)
data.gsub!(/\s|<br \/>/,"")
flag = ""
data = data.gsub(/......../){|x| flag << x.to_i(2).chr}

flag = Digest::SHA512.hexdigest(flag)

body = url(uri, cookie, flag)

regex = /FLAG.*<\/div>/
if regex.match(body) != nil
	flag = regex.match(body).to_s.gsub(/<\/div>/,"")
	print "Flag is: ", flag
else
	print "Wrong or too slow, try again!"
end