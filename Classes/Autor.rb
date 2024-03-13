# classe para representar um autor
class Autor
    attr_reader :nome, :ano_de_nascimento, :livros_escritos

    # método construtor
    def initialize(nome, ano_de_nascimento)
        @nome = nome
        @ano_de_nascimento = ano_de_nascimento
        @livros_escritos = []
    end

    # método para adicionar um livro à lista de livros escritos pelo autor
    def escrever_livro(livro)
        if livro.is_a? Livro
            @livros_escritos << livro
        else
            raise "O parâmetro passado não é um livro"
        end
    end

    #método para retornar a lista de livros escritos pelo autor
    def livros_escritos
        @livros_escritos
    end

    # método para retornar uma string com o nome, o ano de nascimento do autor e o número de livros escritos
    def to_s
        "#{@nome} nascido em #{@ano_de_nascimento}"
    end
end
