from urllib import response
import requests

response = requests.get('https://www.freetogame.com/api/games').json()

print(response)