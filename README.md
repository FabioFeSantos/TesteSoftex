# TesteSoftex

# 📊 Tarefa Técnica - Estruturação dos Dados (Softex)

Este repositório contém a solução para a **Tarefa 1 - Estruturação dos Dados**, proposta no processo seletivo para a vaga de **Analista de Operações (Engenharia de Dados)** na Softex.

## 🧠 Objetivo

Conectar-se à planilha Google fornecida, realizar a ingestão, limpeza e transformação dos dados, e estruturá-los em um banco de dados relacional (SQL Server), tornando-os acessíveis para análises e consultas.

---

## 🧰 Tecnologias Utilizadas

- Python 3.11
- pandas
- gspread
- re
- locale
- unidecode
- oauth2client
- SQL Server
- Google Cloud
- GitHub

---

## 📁 Estrutura do Projeto

```
├── src/
│   └── etl_google_sheets.py      # Script principal de ETL
├── sql/
│   ├── create_table.sql          # Script de criação da tabela no SQL Server
│   └── queries.sql               # Consultas SQL desenvolvidas
├── data/
│   └── export.csv                # Dados exportados após tratamento (opcional)
└── README.md                     # Este documento
```

---

## 🔗 Fonte dos Dados

Planilha Google com as abas:

- `base_dados_projeto`: dados principais
- `dicionário`: descrição dos campos

📎 [Acessar Planilha](https://docs.google.com/spreadsheets/d/1sH2xZoKWklZWirYo1K9EEg167CQV55bbh-ycH3poZPQ)

---

## ⚙️ Etapas do Processo

### 1. Ingestão de Dados

O script Python (`ETL_TESTE_SOFTEX.py`) realiza a conexão à planilha via API do Google Sheets e carrega os dados como um DataFrame `pandas`.

### 2. Transformações Aplicadas

- Limpeza de registros incompletos
-	Padronização de nomes de colunas, passando todas para maiúsculo, alterando espaços por underline e trocando caracteres especiais, seguindo o padrão de formatação UTF8.
-	Conversão de datas para o formato YYYY-MM-DD
-	Remoção de registros com campos críticos nulos (ITEM_ID, ITEM_NAME)


### 3. Armazenamento

Foi criada a tabela `EntregasProjetos` no SQL Server com os seguintes campos:
```sql
CREATE TABLE EntregasProjetos (
    ITEM_ID INT PRIMARY KEY,
    ITEM_NAME VARCHAR(255),
    TARGET_DATE DATE,
    COLUMN_NAME VARCHAR(100),
    LANE VARCHAR(100),
    BLOCK_TIME INT,
    IS_BLOCKED BIT,
    PRIORITY INT,
    SECTION VARCHAR(100),
    DATA_INICIO_ENTREGA DATETIME,
    DATA_FIM_ENTREGA DATETIME,
    SECAO VARCHAR(100)
);
```

### 4. Consultas Desenvolvidas

- Projetos entregues por ano
- Projetos não entregues
- Entregas por trimestre

Os scripts estão disponíveis no arquivo `sql/queries.sql`.

---

## ▶️ Como Executar o Projeto

1. Clone este repositório:
```bash
git clone https://github.com/FabioFeSantos/TesteSoftex.git
cd TesteSoftex
```

2. Instale as dependências:
```bash
pip install pandas gspread oauth2client re unidecode locale
```

3. Crie um projeto no Google Cloud, gere a `credentials.json` com permissões de Google Sheets API e salve na raiz do projeto.

4. Execute o script:
```bash
python src/ETL_TESTE_SOFTEX.py
```

---

## 📌 Observações

- Os dados são fictícios e devem ser utilizados apenas no contexto desta tarefa.
- A planilha **não deve ser compartilhada publicamente**.

---

## 👨‍💻 Autor

[Fábio Ferreira dos Santos]  
