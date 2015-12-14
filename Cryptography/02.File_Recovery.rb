puts `tar xvf Files/c96ac47d3b5c62b67219113fe6524122.tar`

puts `openssl rsautl -decrypt -in flag/flag.enc -out flag/flag.dec -inkey flag/private.pem`

puts "Flag is: " + `cat flag/flag.dec`

`rm -r flag/`