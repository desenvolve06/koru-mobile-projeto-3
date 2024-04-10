import 'pessoa.dart';
import 'produto.dart';
import 'revendedor.dart';

class Cliente extends Pessoa {

  double dinheiro;
  List<Produto> produtosComprados = <Produto>[];

  Cliente(super.genero, this.dinheiro, {required super.nome, required super.cpf, required super.dataNascimento});

  @override
  void falar(String texto) {
    print("Cliente $nome diz: $texto");
  }

  void adicionarDinheiro(double valor) {
    dinheiro += valor;
    print('${nome} após o depósito de $valor agora possui ${dinheiro.toStringAsFixed(2)} reais.');
  }

  void comprarProduto(Produto produto, Revendedor revendedor) {
    if (dinheiro >= produto.valor && produto.qtdEstoque > 0) {
      revendedor.venderProduto(produto);
      dinheiro -= produto.valor;
      produtosComprados.add(produto);
    } else {
      print(
          "$nome não possui saldo suficiente ou o produto ${produto.nome} não tem estoque suficiente para a compra.");
    }
  }
}
