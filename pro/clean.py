import os

l:list = ["bin/", "tmp/", "tests/tests.log"]

for i in l:
	s = "./"+i
	if os.path.exists(s):
		os.system("rm -rf "+s)
	if s[-1] == "/":
		os.mkdir(s)
	else:
		f = open(s, "a")
		f.close
