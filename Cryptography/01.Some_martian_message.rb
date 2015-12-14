
cipher = "SYNTPrfneVfPbbyOhgAbgFrpher"

def rot13(s)
	flag = ""
	s.each_char{|x| flag << x.tr('A-Za-z', 'N-ZA-Mn-za-m')}
	return flag
end

print "Flag is: " + rot13(cipher)