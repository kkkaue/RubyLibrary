# classe para representar um empréstimo
class Emprestimo
    attr_reader :livro, :leitor, :data_de_emprestimo, :data_de_devolucao

    # método construtor
    def initialize(livro, leitor, data_de_emprestimo)
        @livro = livro
        @leitor = leitor
        @data_de_emprestimo = data_de_emprestimo
        @data_de_devolucao = calcular_data_de_devolucao
    end

    # método para retornar uma string com o nome do livro, o nome do leitor, a data de empréstimo e a data de devolução
    def to_s
        "#{@livro} emprestado para #{@leitor} em #{@data_de_emprestimo} e devolvido em #{@data_de_devolucao}"
    end

    private

    # método para calcular a data de devolução
    def calcular_data_de_devolucao
        @data_de_emprestimo + 604800 # 1 semana
    end
end
