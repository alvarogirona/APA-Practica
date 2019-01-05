from subprocess import call
import requests
import time
import json
import os

RIOT_API_KEY = 'RGAPI-54c4d4e7-41ab-42c0-a60d-e8cea8c2b23a'
riot_url = 'https://euw1.api.riotgames.com'
CHAMP_API_KEY= ''
champions_url = 'https://api.champion.gg/v2'
workdir = '/Users/apple/Desktop/APA-Practica'
ELAPSE = 0

def getMatchById(gameId):
	uri = riot_url + '/lol/match/v4/matches/{0}?api_key={1}'.format(str(gameId), RIOT_API_KEY)
	r = requests.get(uri)
	return r.json()

def getChampions():
	uri = champions_url + '/champions/champData=winRate&api_key={0}'.format(API_KEY)
	r = requests.get(uri)
	return r.json()

def saveMatches():
	savedFiles = 0

	print 'Creating dataset'

	call('mkdir data'.split())
	os.chdir(workdir + '/data')

	file = open('../20k_matches_id.txt', 'r')

	for line in file:
		print 'getting match with id {}'.format(line.strip())
		
		matchJSON = getMatchById(line.strip())
		try:
			if matchJSON['status']['status_code'] != 200:
				print 'Error {0}, {1}'.format(matchJSON['status']['status_code'], matchJSON['status']['message'])
				print 'couldn\'t get match with id {} from Riot API\n'.format(line.strip())
			else:
				print 'WARNING: ' + json
		except:
			savedFiles += 1
			out = open('game{}.txt'.format(line.strip()), 'w')
			out.write(json.dumps(matchJSON, indent=4, separators=(',', ': ')))
			out.close()
			print 'Successfully saved game {}\n'.format(line.strip())
		
		time.sleep(0.06)

	print 'Got {} saved matches from file 20k_matches_id'.format(savedFiles)

def saveChampions():
	champsJSON = getChampions()
	print(champsJSON)

saveMatches()
