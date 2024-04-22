import '../utils.dart';
import 'brinde.dart';
import 'pessoa.dart';
import 'produto.dart';
import 'revendedor.dart';

class Cliente extends Pessoa {
  double dinheiro;
  final List<Produto> _produtosComprados = <Produto>[];
  List<Brinde> brindes = <Brinde>[];
  int pontos = 0;

  Cliente({
    required super.nome,
    required super.cpf,
    required super.dataNascimento,
    required super.genero,
    this.dinheiro = 0,
  });

  @override
  void falar(String texto) {
    print("Cliente $nome diz: $texto");
  }

  void adicionarDinheiro(double valor) {
    dinheiro += valor;
    imprimirSaldoAtualizadoAposDeposito(nome, valor, dinheiro);
  }

  void comprarProduto(Produto produto, Revendedor revendedor) {
    try {
      if (dinheiro >= produto.valor) {
        revendedor.venderProduto(produto);
        dinheiro -= produto.valor;
        _produtosComprados.add(produto);
        this.pontos++;
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
    return _produtosComprados.isEmpty ? 0 : _produtosComprados
        .fold(0, (total, produto) => total + produto.valor);
  }

  double calcularMediaProdutosComprados() {
    if (_produtosComprados.isEmpty) {
      return 0;
    }
    double somaDosValoresProdutos =
        _produtosComprados.fold(0, (total, produto) => total + produto.valor);
    return somaDosValoresProdutos / _produtosComprados.length;
  }

  void verResumo() {
    double totalGasto = calcularTotalGasto();
    double mediaProdutos = calcularMediaProdutosComprados();
    totalGastoCliente(nome, totalGasto, mediaProdutos);
  }

  void ordenarProdutosComprados() {
    _produtosComprados.sort((a, b) => a.nome.compareTo(b.nome));
  }

  void verProdutosComprados() {
    if (_produtosComprados.isEmpty) {
      print("Nenhum produto comprado por ${nome}");
      return;
    }
    ordenarProdutosComprados();
    imprimirProdutosOrdenados(_produtosComprados);
  }

  void calcularTotalPontos() {
    print('O cliente ${this.nome} possui ${this.pontos} pontos.');
  }

  void trocarPontosPorBrinde(Brinde brinde) {
    if (this.pontos >= brinde.pontosNecessarios) {
      try {
        this.pontos -= brinde.pontosNecessarios;
        brinde.brinde();
        brindes.add(brinde);
      } catch (exception) {
        print(exception);
      }
    } else {
      print(
          'O cliente ${this.nome} não possui pontos suficientes para trocar por um(a) ${brinde.nome}.');
    }
  }

  void ordenarBrindes() {
    this.brindes.sort((a, b) => a.nome.compareTo(b.nome));
  }

  void verBrindes() {
    if (brindes.isEmpty) {
      print("Nenhum brinde trocado por ${this.nome}");
      return;
    }

    ordenarBrindes();

    print("Brindes trocados por ${this.nome}:");
    for (var brinde in brindes) {
      print("${brinde.nome}");
    }
  }
}
