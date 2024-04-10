import 'classes/pessoa.dart';
import 'classes/produto.dart';
import 'enums/enums.dart';

class Revendedor extends Pessoa {
  final String matricula;
  List<Produto> _produtosVendidos = <Produto>[];

  final double porcentagemDeLucro = 0.2;

  Revendedor(super.genero, this.matricula, {required super.nome, required super.cpf, required super.dataNascimento});

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
      print(_produtosVendidos[0].nome);
    } else {
      print("Produto sem estoque no momento!");
    }
  }
}
