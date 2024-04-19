import '../enums/enums.dart';
import 'pessoa.dart';
import 'produto.dart';

class Revendedor extends Pessoa {
  final String matricula;
  List<Produto> _produtosVendidos = <Produto>[];

  final double porcentagemDeLucro = 0.2;

  Revendedor({required super.nome,
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
    } else {
      throw Exception("No momento não possuímos o produto $nome em estoque.");
    }
  }
}

