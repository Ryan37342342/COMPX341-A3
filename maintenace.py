
import os 
import re
path ="assets"
line = "/**Ryan McCarthy 1348104**/"
fileTree = os.walk(path)
for root,dir_names,file_names in fileTree:
	for filename in file_names:
		if (filename.endswith(".ts")):
			filename = os.path.join(root,filename) 
			with open(filename, 'r+') as f:
				content = f.read()
				f.write('\n')
				f.flush()
				f.seek(0, 0)
				f.write(line + "\n")
				f.flush()
				f.write(content)
				f.flush()
				f.close()
				print (os.path.join(root,filename))	
