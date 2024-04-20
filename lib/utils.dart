import 'classes/produto.dart';

void pularLinha() {
  print('\n');
}

void imprimirSaldoAtualizadoAposDeposito(String nome, double valor, double dinheiro) {
  print('${nome} após o depósito de R\$ $valor agora possui ${dinheiro.toStringAsFixed(2)} reais.');
}

void mostrarQtdProdutoEmEstoque(String nomeProduto, int qtdEstoque) {
  print('$nomeProduto | Quantidade em estoque: $qtdEstoque');
}

void mostrarQtdVendida(String nomeProduto, int qtdVendida, String revendedor) {
  print(
      '$nomeProduto | Quantidade vendida: $qtdVendida | Revendedor: $revendedor');
}


void imprimirResumo(
    String nome, double totalVendido, double media, double lucroObtido) {
  print(
      "* O total vendido por $nome foi de R\$ ${totalVendido.toStringAsFixed(2)} reais "
          "e a média aritmética de valor dos produtos vendidos é de R\$ ${media.toStringAsFixed(2)} reais. "
          "O lucro recebido foi de R\$ ${lucroObtido.toStringAsFixed(2)} reais.");
}

void totalGastoCliente(String nome, double totalGasto, double media) {
  print('Resumo Cliente $nome: O total gasto foi de R\$ ${totalGasto.
  toStringAsFixed(2)} reais e a média de valor dos produtos foi de R\$ ${media.
  toStringAsFixed(2)} reais.');
}

void imprimirProdutosOrdenados(List<Produto> produtos) {
  produtos.map((produto) =>
  'Produtos adquiridos: ${produto.qtdVendida} ${produto.nome} | R\$ ${produto.valor.toStringAsFixed(2)}'
  ).forEach(print);
}

String calcularTotalItensVendidos(Produto produto) {
  int totalItensVendidos = produto.qtdVendida;
  return 'Total de itens vendidos para ${produto.nome}: $totalItensVendidos';
}


void imprimirInformacoesProduto(Produto produto) {
  print('Informações do Produto:');
  print('Total de itens comprados: ${produto.qtdVendida}');
  print(calcularTotalItensVendidos(produto));
}
