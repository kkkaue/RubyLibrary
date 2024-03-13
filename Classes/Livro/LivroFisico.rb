require_relative 'Livro'

# classe que representa um livro físico
class LivroFisico < Livro
    attr_reader :peso

    # método construtor
    def initialize(titulo, autor, paginas, ano_de_publicacao, peso)
        super(titulo, autor, paginas, ano_de_publicacao)
        @peso = peso
    end

    # método para exibir as informações do livro
    def to_s
        "#{super} - Peso: #{@peso}"
    end
end
