
import os

f = open("/Users/alvaro/Documents/Uni/4o/APA/APA-Practica/20k_matches.json", "w")
f.write("{matches:[")
f.close()

for file in os.listdir("/Users/alvaro/Documents/Uni/4o/APA/APA-Practica/data"):
	f = open("/Users/alvaro/Documents/Uni/4o/APA/APA-Practica/20k_matches.json", "a")
	match_file = open("/Users/alvaro/Documents/Uni/4o/APA/APA-Practica/data/" + file, "r")
	match_json = match_file.read()
	f.write(match_json + ",")


f.write("]")