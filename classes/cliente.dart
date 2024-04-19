import 'pessoa.dart';
import 'produto.dart';
import 'revendedor.dart';

class Cliente extends Pessoa {
  double dinheiro;
  List<Produto> _produtosComprados = <Produto>[];

  Cliente({
    required super.nome,
    required super.cpf,
    required super.dataNascimento,
    required super.genero,
    this.dinheiro = 0,
  });

  /// Dinheiro precisava ser opcional, mas caso recebesse como atributo nullable tinha possibilidade de ser null, causando problema na hora de adicionar o dinheiro, com ele tendo padrão como "0" ainda fica opcional no construtor mas caso não seja recebido não dará problema para adições futuras

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
    try {
      if (dinheiro >= produto.valor) {
        revendedor.venderProduto(produto);
        dinheiro -= produto.valor;
        _produtosComprados.add(produto);
      } else {
        print('O cliente não tem saldo suficiente para comprar o produto');
      }
    } catch (exception) {
      if (exception is Exception) {
        throw Exception("No momento não possuímos o produto ${produto.nome}");
      }
    }
  }
}
