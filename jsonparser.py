import json


with open('data.json') as data_file:    
    data = json.load(data_file)

for product in data['Products']:
    print product['vendor']
    print product['product']
    print product['version']

# print(data['Products'][0]['product'])


