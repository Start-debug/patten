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
c = input()
file = open('./pro/JarPath.json', 'r+', encoding='utf-8')
data:dict = json.load(file)
data.setdefault(c, list())
while True:
	s = input()	if s == "exit" or s == "quit":
		break
	else:
		data[c].append(s)
file.seek(0)
file.truncate()
json.dump(data,file)
file.close()
