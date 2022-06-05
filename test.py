from urllib import response
import requests

response = requests.get('https://www.panshoots.cl/api/producto.php').json()

print(response)