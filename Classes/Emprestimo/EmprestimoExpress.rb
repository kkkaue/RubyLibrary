require_relative 'Emprestimo'

# classe para representar um empréstimo vip
class EmprestimoExpress < Emprestimo

    # método construtor
    def initialize(livro, leitor, data_de_emprestimo)
        super(livro, leitor, data_de_emprestimo)
        @data_de_devolucao = calcular_data_de_devolucao
    end

    # método para calcular a data de devolução
    def calcular_data_de_devolucao
        @data_de_emprestimo + 1814400 # 3 semanas
    end
end
