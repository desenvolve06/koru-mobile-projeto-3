class Brinde{
  final String nome;
  final int pontosNecessarios;
  int qtdEmEstoque;

  Brinde({
    required this.nome, 
    required this.pontosNecessarios, 
    required this.qtdEmEstoque
  });

  void calcularPontosNecessarios(){
    print('Para ganhar um(a) ${this.nome} você precisa de ${this.pontosNecessarios} pontos.');
  }

  void brinde(){
    if(this.qtdEmEstoque > 0){
      this.qtdEmEstoque--;
      print('Troca realizada! Você ganhou um(a) ${this.nome}.');
    } else {
      throw Exception('No momento não possuímos o produto ${this.nome} em estoque.');
    }
  }
}