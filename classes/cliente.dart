import 'pessoa.dart';
import 'produto.dart';
import 'revendedor.dart';

class Cliente extends Pessoa {

  double dinheiro;
  List<Produto> _produtosComprados = <Produto>[];

  Cliente(super.genero, this.dinheiro,
      {required super.nome, required super.cpf, required super.dataNascimento});

  @override
  void falar(String texto) {
    print("Cliente $nome diz: $texto");
  }

  void adicionarDinheiro(double valor) {
    dinheiro += valor;
    print(
        '${nome} após o depósito de $valor agora possui ${dinheiro.toStringAsFixed(2)} reais.');
  }

  void comprarProduto(Produto produto, Revendedor revendedor) {
    // if (dinheiro >= produto.valor && produto.qtdEstoque > 0) {
    try {
      if(dinheiro>= produto.valor) {
        revendedor.venderProduto(produto);
        dinheiro -= produto.valor;
        _produtosComprados.add(produto);
      } else {
        print('O cliente não tem saldo suficiente para comprar o produto');
      }
    } catch (exception) {
      if (exception is Exception) {
        throw Exception(
            "No momento não possuímos o produto ${produto
                .nome} em estoque. MÉTODO COMPRAR PRODUTO NA CLASSE CLIENTE");
      }
    }

    // } else {
    //   print('O cliente não tem saldo suficiente para comprar o produto');
    // }
  }
}
