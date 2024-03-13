require_relative 'Livro'

# classe para representar um livro digital
class LivroDigital < Livro
    attr_reader :formato

    # método construtor
    def initialize(titulo, autor, paginas, ano_de_publicacao, formato)
        super(titulo, autor, paginas, ano_de_publicacao)
        @formato = formato
    end

    # método para exibir as informações do livro
    def to_s
        "#{super} - Formato: #{@formato}"
    end
end
