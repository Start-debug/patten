import os

l:list = os.listdir("./src")
dic:dict = {".java":".class", ".c":""}

for i in l:
	i = str(i)
	s = i[i.rindex("."):]
	os.system("make "+i.replace(s, dic[s]));
