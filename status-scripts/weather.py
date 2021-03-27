#!/usr/bin/env python3
import requests
import json

temperature = None
description = None
try:
    response = requests.get('https://openweathermap.org/data/2.5/weather?id=1283240&units=metric&appid=439d4b804bc8187953eb36d2a8c26a02')
    content = response.text
    data = json.loads(content)
    temperature = data['main']['temp']
    description = data['weather'][0]['description']
except Exception as e:
    pass

if temperature is not None:
    print("{}°C, {}".format(temperature, description))

