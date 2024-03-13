require_relative 'Emprestimo'

# classe para representar um empréstimo vip
class EmprestimoVip < Emprestimo

    # método construtor
    def initialize(livro, leitor, data_de_emprestimo)
        super(livro, leitor, data_de_emprestimo)
        @data_de_devolucao = calcular_data_de_devolucao
    end

    # método para calcular a data de devolução
    def calcular_data_de_devolucao
        @data_de_emprestimo + 1209600 # 2 semanas
    end
end
