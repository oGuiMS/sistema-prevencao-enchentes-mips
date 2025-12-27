# Sistema de Prevenção de Enchentes em Assembly MIPS
Projeto desenvolvido para a disciplina de Arquitetura e Organização de Computadores (UNIFESP - 2025). O sistema utiliza dados reais para prever enchentes na região do Amazonas e permite simulação de investimentos públicos para mitigação de riscos.

##Funcionalidades
- **Previsão de Enchentes:** Cálculo em ponto flutuante considerando cotas fluviais e precipitação.
- **Visualização Gráfica:** Mapa interativo usando Bitmap Display do MARS (Vermelho = Alerta, Branco = Normal).
- **Simulação Financeira:** Módulo de investimentos onde o usuário aloca verba (Arborização, Saneamento, Urbanização) e vê a redução do risco em tempo real.
- **Persistência de Dados:** Leitura e escrita em arquivo binário (`dados.bin`).

##Tecnologias
- **Linguagem:** Assembly MIPS
- **Simulador:** MARS 4.6U
- **Script Auxiliar:** Python (para gerar os binários a partir do arquivo CSV)

##Como rodar
1. Baixe o simulador MARS.
2. Abra o arquivo `trabalhoaoc.asm` no MARS.
3. Certifique-se de que a opção "Assemble all files in directory" esteja marcada nas configurações.
4. Abra o `Bitmap Display` (Tools -> Bitmap Display) e configure:
   - Unit Width/Height: 8
   - Display Width: 1024 / Height: 512
   - Base Address for Display: 0x10040000
5. Conecte o Bitmap e execute o código.

##Integrantes
- Guilherme Miguel Spyrides Leite Ferro
- Karen Rodrigues de Melo
- Luiza Dugois Silva Alves
- Maria Clara Freire Araújo
