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

  double calcularTotalGasto() {
    double totalGasto=0;
    for (var produto in _produtosComprados) {
      totalGasto += produto.valor;
    }
    return totalGasto;
  }

  //aqui temos um retorno 0, pois não é possível dividir um número por 0, pois segundo a matemática cai na indeterminação.
  double calcularMediaProdutosComprados(){

    if(_produtosComprados.isEmpty){
      return 0;
    }

    double somaDosValoresProdutos = 0;
    for (var produto in _produtosComprados){
      somaDosValoresProdutos += produto.valor;
    }

    return somaDosValoresProdutos / _produtosComprados.length;
  }

  void verResumo(){
    print('O total gasto por ${this.nome} foi ${calcularTotalGasto()} '
    'e a média aritmética do valor dos produtos comprados é '
    '${calcularMediaProdutosComprados().toStringAsFixed(2)} reais');
  }

  void ordenarProdutosComprados() {
  _produtosComprados.sort((a, b) => a.nome.compareTo(b.nome));
  }

  List<Produto> get produtosComprados => _produtosComprados;


  void verProdutosComprados() {
    if (_produtosComprados.isEmpty) {
      print("Nenhum produto comprado por ${nome}");
      return;
    }

    ordenarProdutosComprados();

    print("Produtos comprados por ${nome}:");
    for (var produto in _produtosComprados) {
      print("${produto.nome} - ${produto.valor.toStringAsFixed(2)}");
    }
  }


}
