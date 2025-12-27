import pandas as pd
import struct
import os

def gerar_dados_bin():
    #caminho daonde o código pega a tabela
    caminho_excel = '/Users/guilhermeferro/Desktop/TrabalhoAOC/AOC.xlsx'
    
    #o arquivo gerado ficará na mesma pasta do excel
    pasta_destino = os.path.dirname(caminho_excel)
    caminho_saida = os.path.join(pasta_destino, 'dados.bin')

    print(f"Lendo arquivo: {caminho_excel}")

    if not os.path.exists(caminho_excel):
        print(f"ERRO: O arquivo não foi encontrado no caminho: {caminho_excel}")
        return

    try:
        df = pd.read_excel(caminho_excel, engine='openpyxl')

        colunas_interesse = [
            'Urbanização das vias públicas (%)',
            'Arborização de vias públicas (%)',
            'Esgotamento sanitário por rede geral, rede pluvial ou fossa ligada à rede (%)',
            'Cota de Alerta (cheia) (m)',
            'Cota atual 17/05/24 (m)',
            'Precipitação dez - fev (mm)',
            'Precipitação mar - mai (mm)',
            'Precipitação jun - ago (mm)',
            'Precipitação set - nov (mm)',
            'Vazão'
        ]

        valores_floats = []

        for index, row in df.iterrows():
            for col in colunas_interesse:
                valor = row[col]
                
                if col == 'Vazão':
                    if isinstance(valor, str):
                        valor = valor.replace(' L/s', '').replace('.', '').strip()
                
                try:
                    valores_floats.append(float(valor))
                except (ValueError, TypeError):
                    valores_floats.append(0.0)

        with open(caminho_saida, 'wb') as f:
            pacote = struct.pack(f'<{len(valores_floats)}f', *valores_floats)
            f.write(pacote)

        print("-" * 40)
        print(f"SUCESSO!")
        print(f"Arquivo gerado: {caminho_saida}")
        print(f"Total de valores gravados: {len(valores_floats)}")
        print("-" * 40)

    except ImportError:
        print("ERRO DE BIBLIOTECA: Você precisa instalar o pandas e openpyxl.")
        print("Rode no terminal: pip install pandas openpyxl")
    except Exception as e:
        print(f"Ocorreu um erro inesperado: {e}")

if __name__ == "__main__":
    gerar_dados_bin()