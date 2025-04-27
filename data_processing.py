import pandas as pd

df = pd.read_csv('jan.csv', encoding='ISO-8859-1')
df[['Title', 'Description']] = df['Description'].str.split(r'[;,]', n=1, expand=True)
df.to_csv('modified_jan.csv', index=False)
