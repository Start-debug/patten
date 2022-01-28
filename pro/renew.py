import os

l:list = os.listdir("./src")
q:list = list()
dic:dict = {".java":".class", ".c":""}

def finder(li:list):
	for i in li:
		if os.path.isdir(i):
			finder(os.listdir(i))
		else:
			s = i[i.rindex("."):]
			q.append(i.replace(s, dic[s]))
	return
	
finder(l)
q = list(set(q))
for i in q:
	os.system("make "+i)
