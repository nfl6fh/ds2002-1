import requests
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
import time
import json


def main():
    stock = input("What stock would you like to look up? ")
    url = f"https://query1.finance.yahoo.com/v7/finance/quote?symbols={stock}"
    url1 = f"https://query1.finance.yahoo.com/v11/finance/quoteSummary/{stock}?modules=financialData"
    header_var = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36'
        ' (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'
    }

    r = requests.get(url, headers=header_var)
    r1 = requests.get(url1, headers=header_var)
    if r.status_code != 200 or r1.status_code != 200:
        print(
            f'Failed API Call {"request 1" if r.status_code != 200 else "request 2"}. Status code {r.status_code if r.status_code != 200 else r1.status_code}')
        return -1
    r_json = r.json()
    r1_json = r1.json()
    if len(r_json['quoteResponse']['result']) == 0 or len(r1_json['quoteSummary']['result']) == 0:
        print('At least one empty JSON returned. exiting')
        return -1
    relevant_json = r_json['quoteResponse']['result'][0]
    other_relevant_json = r1_json['quoteSummary']['result'][0]['financialData']

    combined = {
        'symbol': relevant_json['symbol'],
        'longName': relevant_json['longName'],
        'regularMarketPrice': relevant_json['regularMarketPrice'],
        'tgtmp': other_relevant_json['targetMeanPrice']['raw'],
        'cashOnHand': other_relevant_json['totalCash']['raw'],
        'profitMargin': other_relevant_json['profitMargins']['fmt'],
        'date': time.strftime('%m/%d/%Y', time.localtime())
    }

    interested_fields = [('date', 'Date Retrieved'), ('symbol', 'Ticker Symbol'), ('longName', 'Full Name'),
                         ('regularMarketPrice',
                          'Current Price'), ('tgtmp', 'Target Mean Price'),
                         ('cashOnHand', 'Cash On Hand'), ('profitMargin', 'Profit Margin')]
    full_dict = True
    for field in interested_fields:
        field_response = combined.get(field[0]) if combined.get(
            field[0]) else 'Value not found'
        if not combined.get(field[0]):
            full_dict = False
        print(f'{field[1]}:', field_response)

    if full_dict:
        with open(f"mywork/{stock}_{time.strftime('%m-%d-%Y', time.localtime())}_dump.json", 'w') as file:
            json.dump(combined, file)


main()
