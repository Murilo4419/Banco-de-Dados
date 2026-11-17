# Importa a biblioteca
import sqlite3

try: # Tenta executar os comandos abaixo
    banco = sqlite3.connect('banco.db') # Cria uma conexão com o banco de dados

    cursor = banco.cursor() # Utiliza o cusor do banco de dados para executar instruções SQL

    cursor.execute("CREATE TABLE aluno(id_aluno int, Nome text, idade int, email text)") # Executa o comando dado  

    cursor.execute("INSERT INTO aluno VALUES (1, 'JOÃO',20,'joaozinholeroy@gmail.com') ") # Executa o comando dado de adicionar Nome, Idade e Email referente ao id 1
    cursor.execute("INSERT INTO aluno VALUES (2, 'jheimes',25,'rick@gmail.com') ") # Executa o comando dado de adicionar Nome, Idade e Email referente ao id 2
    cursor.execute("INSERT INTO aluno VALUES (3, 'ricardo',26,'jheimesbrow@gmail.com') ") # Executa o comando dado de adicionar Nome, Idade e Email referente ao id 3
    banco.commit() # Confirma as alterações no banco de dados usado
    print("Os dados foram adicionados com sucesso!!") # Mostra a mensagem na tela ao executar o comando


    cursor.execute("Select *FROM aluno") # Seleciona a tabela aluno e mostra os dados inseridos nela
    print(cursor.fetchall()) # Exibe na tela todos os registros recuperados da tabela

    cursor.execute("DELETE from aluno WHERE idade = 20") # Executa o comando de deletar os dados de idade igual a 20 prensentes na tabela aluno

    banco.commit() # Confirma as alterações no banco de dados utilizado
    banco.close() # Fecha a conexão existente com o banco de dados utilizado
    print("Os dados foram removidos com sucesso!!") # Mostra a mensagem na tela ao executar o comando

except sqlite3.Error as erro: # Captura erros específicos do SQLite
    print("Erro ao excluir: ", erro) # Mostra a mensagem de erro na tabela ao tentar executar o comando 
