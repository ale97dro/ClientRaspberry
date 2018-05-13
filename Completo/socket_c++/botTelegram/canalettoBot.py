import sys
import os
import telepot
import time
import random
import subprocess

def rispondi (msg):
	chat_id = msg['chat']['id']
	comando = msg['text']

	if comando == '/info':
		bot.sendMessage(chat_id, "Avvio lo script di sniffing sul Raspberry")
	elif comando == '/avvia':
		bot.sendMessage(chat_id, "Script avviato")
		#subprocess.call(['./sniffer.sh'])
		os.system('./sniffer.sh')

print "Avvio bot"
bot = telepot.Bot(string_bot)
bot.message_loop(rispondi)

while 1:
	time.sleep(10)
