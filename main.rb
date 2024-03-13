# main.rb

require_relative 'Classes/Biblioteca.rb'
require_relative 'Classes/Livro/LivroDigital.rb'
require_relative 'Classes/Livro/LivroFisico.rb'
require_relative 'Classes/Autor.rb'
require_relative 'Classes/Leitor.rb'

# crição dos objetos
biblioteca1 = Biblioteca.new("Biblioteca Municipal")
biblioteca2 = Biblioteca.new("Biblioteca Pública")
autor = Autor.new("Machado de Assis", 1839)
livro1 = LivroDigital.new("Dom Casmurro", autor, 256, 1899, "PDF")
livro2 = LivroFisico.new("Memórias Póstumas de Brás Cubas", autor, 256, 1881, "300g")
livro3 = LivroFisico.new("Quincas Borba", autor, 256, 1891, "300g")
leitor1 = Leitor.new("João", "vip")
leitor2 = Leitor.new("Maria", "express")
leitor3 = Leitor.new("José")

#adiciona ao autor o livro criado
autor.escrever_livro(livro1)
autor.escrever_livro(livro2)

# adição do livro à biblioteca
biblioteca1.adicionar_livro(livro1)
biblioteca1.adicionar_livro(livro2)

biblioteca2.adicionar_livro(livro1)
biblioteca2.adicionar_livro(livro2)
biblioteca2.adicionar_livro(livro3)

# solicita emprestimo do livro
leitor1.solicitar_emprestimo(livro1, biblioteca1)

puts leitor1.livros_emprestados

if livro1.emprestado?
    puts "Livro emprestado"
else
    puts "Livro não emprestado"
end

puts "---------------------------------"

leitor2.solicitar_emprestimo(livro1, biblioteca1)
leitor2.solicitar_emprestimo(livro1, biblioteca2)
leitor2.solicitar_emprestimo(livro2, biblioteca2)
puts leitor2.livros_emprestados

puts "---------------------------------"

puts Biblioteca.obter_bibliotecas

puts "---------------------------------"

biblioteca1.mostrar_livros_emprestados
biblioteca2.mostrar_livros_emprestados
