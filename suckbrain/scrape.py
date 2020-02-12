#!/bin/python

import requests
from bs4 import BeautifulSoup

url = "https://www.instagram.com/{}/"

def scrape(username):
	full_url = url.format(username)
	r = requests.get(full_url)
	s = BeautifulSoup(r.text,"lxml")

	tag = s.find("meta",attrs = {"name":"description"})
	text = tag.attrs['content']
	main_text = text.split("-")[0]

	return main_text


name = "user_forward"
data = scrape(name)
print(data)
