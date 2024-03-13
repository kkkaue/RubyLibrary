require_relative 'Emprestimo'

# classe para representar um empréstimo regular
class EmprestimoRegular < Emprestimo

    # método construtor
    def initialize(livro, leitor, data_de_emprestimo)
        super(livro, leitor, data_de_emprestimo)
    end
end
