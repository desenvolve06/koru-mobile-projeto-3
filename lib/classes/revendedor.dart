import '../enums/enums.dart';
import '../utils.dart';
import 'pessoa.dart';
import 'produto.dart';

class Revendedor extends Pessoa {
  final String matricula;
  List<Produto> _produtosVendidos = <Produto>[];

  final double porcentagemDeLucro = 0.2;
  double totalProdutosVendidos = 0.0;

  Revendedor(
      {required super.nome,
      required super.cpf,
      required super.dataNascimento,
      required super.genero,
      required this.matricula});

  @override
  void falar(String texto) {
    String titulo;
    switch (genero) {
      case (Genero.masculino):
        titulo = 'Revendedor';
        break;
      case (Genero.feminino):
        titulo = 'Revendedora';
        break;
      case (Genero.outro):
        titulo = 'Pessoa revendedora';
        break;
      default:
        titulo = 'Pessoa';
    }
    print('$titulo ${nome} diz: ${texto}');
  }

  void venderProduto(Produto produto) {
    if (produto.qtdEstoque > 0) {
      produto.realizarVenda();
      _produtosVendidos.add(produto);
      totalProdutosVendidos += produto.valor;
    } else {
      throw Exception("No momento não possuímos o produto $nome em estoque.");
    }
  }

  double calcularTotalVendido() {
    return _produtosVendidos.isEmpty
        ? 0 : _produtosVendidos.fold(0, (total, produto) => total + produto.valor);
  }

  double calcularMediaProdutosVendidos() => _produtosVendidos.isEmpty
        ? 0 : totalProdutosVendidos / _produtosVendidos.length;

  double calcularLucro() => totalProdutosVendidos * porcentagemDeLucro;

  void verResumo() {
    double totalVendido = calcularTotalVendido();
    double media = calcularMediaProdutosVendidos();
    double lucroObtido = calcularLucro();
    imprimirResumo(nome, totalVendido, media, lucroObtido);
  }
}
