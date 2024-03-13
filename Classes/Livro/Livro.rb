# classe para representar um livro
class Livro
    attr_reader :titulo, :autor, :paginas, :ano_de_publicacao

    # método construtor
    def initialize(titulo, autor, paginas, ano_de_publicacao)
        @titulo = titulo
        @autor = autor
        @paginas = paginas
        @ano_de_publicacao = ano_de_publicacao
        @emprestado = false
    end

    # método para exibir as informações do livro
    def to_s
        "#{@titulo} por #{@autor}"
    end

    # método para verificar se o livro está emprestado
    def emprestado?
        @emprestado
    end

    # método para marcar o livro como emprestado
    def marcar_como_emprestado
        emprestar
    end

    # método para marcar o livro como devolvido
    def marcar_como_devolvido
        devolver
    end

    private

    # método para marcar o livro como emprestado
    def emprestar
        @emprestado = true
    end

    # método para marcar o livro como devolvido
    def devolver
        @emprestado = false
    end
end
