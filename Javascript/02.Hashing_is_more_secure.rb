# Look's like weak JavaScript auth script :)
# $(".c_submit").click(function(event) {
# 	event.preventDefault();
# 	var p = $("#cpass").val();
# 		if(Sha1.hash(p) == "b89356ff6151527e89c4f3e3d30c8e6586c63962") {
# 		    if(document.location.href.indexOf("?p=") == -1) {   
# 		        document.location = document.location.href + "?p=" + p;
# 		    }
# 		} else {
# 		    $("#cresponse").html("<div class='alert alert-danger'>Wrong password sorry.</div>");
# 		}
# });

require 'net/http'
require 'uri'

url = "http://md5decrypt.net/en/Sha1/"
hash = "b89356ff6151527e89c4f3e3d30c8e6586c63962"

#Setup POST request and response.
uri = URI.parse(url)
http = Net::HTTP.new(uri.host, 80)
reqst = Net::HTTP::Post.new(uri.request_uri)
reqst.set_form_data({"hash" => hash, "decrypt" => "Decrypt"})
response = http.request(reqst)

#Find result of the hash.
body = response.body

regex = /#{hash} : <b>(.+)\<\/b>/
regex =~ body

print "Password: " + Regexp.last_match(1)