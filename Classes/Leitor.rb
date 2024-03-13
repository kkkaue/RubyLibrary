# class para representar um leitor
class Leitor
    attr_reader :nome, :livros_emprestados, :tipo

    # método construtor
    def initialize(nome, tipo = "Comum")
        @nome = nome
        @tipo = tipo
        @livros_emprestados = []
    end

    # método para solicitar emprestimo da biblioteca
    def solicitar_emprestimo(livro, biblioteca)
        if biblioteca.emprestar_livro(livro, self, Time.now)
            emprestar_livro(livro)
            puts "Empréstimo bem-sucedido do livro '#{livro.titulo}'"
        else
            puts "Empréstimo falhou. O livro pode não estar disponível."
        end
    end

    # método para retornar a lista de livros emprestados pelo leitor
    def livros_emprestados
        @livros_emprestados
    end

    # método para retornar uma string com o nome do leitor e o número de livros emprestados
    def to_s
        "#{@nome} emprestou #{@livros_emprestados.length} livros"
    end

    private

    # método para adicionar um livro à lista de livros emprestados pelo leitor
    def emprestar_livro(livro)
        if livro.is_a? Livro
            @livros_emprestados << livro
        else
            raise "O parâmetro passado não é um livro"
        end
    end
end
