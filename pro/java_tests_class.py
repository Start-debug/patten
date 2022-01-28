import os
import sys
import json

try:
	file = open('./pro/JarPath.json','x')
except FileExistsError:
	pass
else:
	json.dump(dict(),file)
	file.close()
file = open('./pro/JarPath.json', 'r+', encoding='utf-8')
data:dict = json.load(file)
data.setdefault(sys.argv[1], list())

s = sys.argv[1]
c = "javac tests/"+s+" -d tmp/"
if data[s] != list():
	c += " -cp "
	for i in data[s]:
		c += i+" "
os.system(c)
