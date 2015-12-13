require 'net/http'
require 'uri'

uri = "http://ringzer0team.com/challenges/32/"
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
data_arr = data.split(/\+|\-/)

flag = data_arr[0].to_i + data_arr[1].to_i(16) - data_arr[2].to_i(2)

body = url(uri, cookie, flag.to_s)

regex = /FLAG.*<\/div>/
if regex.match(body) != nil
	flag = regex.match(body).to_s.gsub(/<\/div>/,"")
	print "Flag is: ", flag
else
	print "Wrong or too slow, try again!"
end