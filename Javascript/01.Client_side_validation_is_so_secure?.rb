# Look's like weak JavaScript auth script :)
# 	$(".c_submit").click(function(event) {
# 		event.preventDefault()
# 		var u = $("#cuser").val();
# 		var p = $("#cpass").val();
# 		if(u == "admin" && p == String.fromCharCode(74,97,118,97,83,99,114,105,112,116,73,115,83,101,99,117,114,101)) {
# 			if(document.location.href.indexOf("?p=") == -1) {   
# 				document.location = document.location.href + "?p=" + p;
# 				}
# 			} else {
# 				$("#cresponse").html("<div class='alert alert-danger'>Wrong password sorry.</div>");
# 			}
# 	});

pass_enc = "74,97,118,97,83,99,114,105,112,116,73,115,83,101,99,117,114,101"

puts "Username: admin"
print "Password: "
pass_enc.split(",").each{|x| print x.to_i.chr}