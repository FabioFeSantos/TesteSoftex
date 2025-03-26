import pandas as pd
import re
from unidecode import unidecode
import gspread
from google.oauth2.service_account import Credentials
import locale

# Autenticação com Google Sheets
SCOPES = ['https://www.googleapis.com/auth/spreadsheets', 'https://www.googleapis.com/auth/drive']
creds = Credentials.from_service_account_file('C:/Users/Fabio/credentials.json', scopes=SCOPES)
client = gspread.authorize(creds)

# Abrir a planilha e a aba de dados
spreadsheet_url = 'https://docs.google.com/spreadsheets/d/1sH2xZoKWklZWirYo1K9EEg167CQV55bbh-ycH3poZPQ'
sheet = client.open_by_url(spreadsheet_url)
data = sheet.worksheet('base_dados_projeto').get_all_records()
df = pd.DataFrame(data)

# Limpeza e transformação dos dados
df.columns = [re.sub(r'[^A-Z0-9_]', '_', unidecode(col.upper()).replace(" ", "_")) for col in df.columns]
locale.setlocale(locale.LC_TIME, 'pt_BR.UTF-8')
df['DATA_ALVO'] = pd.to_datetime('TARGET_DATE', format="%A, %d de %B de %Y", errors='coerce')
df['DATA_INICIO_ENTREGA'] = pd.to_datetime(df['DATA_INICIO_ENTREGA'], errors='coerce')
df['DATA_FIM_ENTREGA'] = pd.to_datetime(df['DATA_FIM_ENTREGA'], dayfirst=True, errors='coerce')
df = df.dropna(subset=['ITEM_ID', 'ITEM_NAME'])

# Exportar como CSV
df.to_csv('C:/Users/Fabio/export.csv', index=False)
print("Dados transformados e exportados com sucesso.")