class Produto {
  final String nome;
  late double valor;
  late int qtdEstoque;
  int qtdVendida = 0;

  Produto({required this.nome, required this.valor, required this.qtdEstoque});

  void realizarVenda() {
    if (qtdEstoque > 0) {
      qtdVendida += 1;
      qtdEstoque -= 1;
      print('Compra de $qtdVendida $nome realizada com sucesso!!!!');
    } else {
      throw Exception("No momento não possuímos o produto $nome em estoque.");
    }
  }

  double verReceitaGerada() {
    return qtdVendida * valor;
  }
}
