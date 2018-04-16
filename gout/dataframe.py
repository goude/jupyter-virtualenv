''' Utilities for simplifying DataFrame work. '''
import pandas as pd
import requests


def read_api(url, prop):
    res = requests.get(url)
    json = res.json()
    data = json[prop]
    df = pd.DataFrame(data)
    return df
