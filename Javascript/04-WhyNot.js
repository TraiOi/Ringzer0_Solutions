var k = new Array(176,214,205,246,264,255,227,237,242,244,265,270,283);
var u = "administrator";
var pass = ""
for(i=0;i<u.length;i++){
	pass += String.fromCharCode(k[i]-i*10-u.charCodeAt(i))
}

console.log("Username: administrator")
console.log("Password: "+pass)