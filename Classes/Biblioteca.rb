require_relative 'Emprestimo/EmprestimoExpress'
require_relative 'Emprestimo/EmprestimoRegular'
require_relative 'Emprestimo/EmprestimoVip'
require_relative 'Livro/Livro'

# classe que representa uma biblioteca
class Biblioteca
    attr_reader :nome, :livros

    @@bibliotecas = []

    # método construtor
    def initialize(nome)
        @nome = nome
        @livros = []
        @emprestimos = []
        @@bibliotecas << self
    end

    # método para exibir as bibliotecas criadas
    def self.obter_bibliotecas
        @@bibliotecas
    end

    # método para adicionar um livro à lista de livros da biblioteca
    def adicionar_livro(livro)
        if livro.is_a? Livro
            @livros << livro
        else
            raise "O parâmetro passado não é um livro"
        end
    end

    # método para emprestar um livro a um leitor
    def emprestar_livro(livro, leitor, data_de_emprestimo)
        if !livro_disponivel?(livro)
            puts "Livro não disponível para empréstimo"
            return false
        end
        emprestimo = criar_emprestimo(livro, leitor, data_de_emprestimo)
        @emprestimos << emprestimo
        livro.marcar_como_emprestado
        return true
    end

    # método para mostrar os livros emprestados
    def mostrar_livros_emprestados
        @emprestimos.each do |emprestimo|
            periodo_emprestimo = emprestimo.data_de_devolucao - emprestimo.data_de_emprestimo
            numero_semanas = (periodo_emprestimo / 604800).round
            puts "Livro: #{emprestimo.livro.titulo}, Leitor: #{emprestimo.leitor.nome}, Período: #{emprestimo.data_de_emprestimo.strftime('%d/%m/%Y')} - #{emprestimo.data_de_devolucao.strftime('%d/%m/%Y')}, Duração: #{numero_semanas} semanas"
        end
    end

    # método para retornar a lista de livros da biblioteca
    def obter_livros
        @livros
    end

    # método para retornar uma string com o nome da biblioteca e o número de livros que ela possui
    def to_s
        "#{@nome} possui #{@livros.length} livros"
    end

    private

    # método para criar um empréstimo com base no tipo de leitor
    def criar_emprestimo(livro, leitor, data_de_emprestimo)
        case leitor.tipo
        when "comum"
            EmprestimoRegular.new(livro, leitor, data_de_emprestimo)
        when "vip"
            EmprestimoVip.new(livro, leitor, data_de_emprestimo)
        when "express"
            EmprestimoExpress.new(livro, leitor, data_de_emprestimo)
        else
            raise "Tipo de leitor desconhecido"
        end
    end

    # método para verificar se um livro está disponível para empréstimo
    def livro_disponivel?(livro)
        @livros.include?(livro) && !@emprestimos.any? { |emprestimo| emprestimo.livro == livro }
    end
end
