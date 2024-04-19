import 'classes/cliente.dart';
import 'classes/pessoa.dart';
import 'classes/produto.dart';
import 'classes/revendedor.dart';
import 'enums/enums.dart';
import 'utils.dart';

main() {
  /* Declaração de objetos Revendedor */
  Revendedor revendedor1 = Revendedor(nome: "Jorge",
      cpf: "064646464",
      dataNascimento: DateTime(2000, 12, 02),
      genero: Genero.masculino,
      matricula: "123456");
  Revendedor revendedor2 = Revendedor(nome: "Ana",
      cpf: "064646464",
      dataNascimento: DateTime(2000, 12, 02),
      genero: Genero.feminino,
      matricula: "123456");

  // Criando um cliente
  Cliente cliente1 = Cliente(
    nome: 'Heitor',
    cpf: '1111',
    dataNascimento: DateTime(2000, 12, 02),
    genero: Genero.masculino,
    dinheiro: 100,
  );
    Cliente cliente2 = Cliente(
    nome: 'Carla',
    cpf: '1111',
    dataNascimento: DateTime(2000, 12, 02),
    genero: Genero.feminino,
  );


  /* Declaração de objetos Produto */
  Produto produto1 = Produto(nome: 'Colônia Floratta Flores Secretas 75ml',
      valor: 133.33,
      qtdEstoque: 1); // Produto
  Produto produto2 = Produto(nome: 'Glamour Myriad Desodorante Colônia 75ml',
      valor: 154.90,
      qtdEstoque: 1); // Produto


  /* Testes método falar() */
  String textoRevendedor = 'Olá como vai';
  String textoCliente = 'Quero comprar um produto';
  pularLinha();
  revendedor1.falar(textoRevendedor);
  cliente1.falar(textoCliente);

  //Add dinheiro
  print('Cliente tem o seguinte saldo ${cliente1.dinheiro} antes do depósito');
  cliente1.adicionarDinheiro(1000);
  pularLinha();

//aqui o cliente compra o produto e nele já tem um método que chama o revendedor.venderProduto
  cliente1.comprarProduto(produto1, revendedor1);
  print('valor produto: ${produto1.valor}  Saldo final cliente: ${cliente1.dinheiro.toStringAsFixed(2)}');
  cliente1.comprarProduto(produto2, revendedor1);
    print('valor produto: ${produto2.valor}  Saldo final cliente: ${cliente1.dinheiro.toStringAsFixed(2)}');

  print('estoque do ${produto1.nome}: ${produto1.qtdEstoque}');
  print('vendido do ${produto1.nome}: ${produto1.qtdVendida}');
  print('estoque do ${produto2.nome}: ${produto2.qtdEstoque}');
  print('vendido do ${produto2.nome}: ${produto2.qtdVendida}');

  pularLinha();
  print('Informações do Produto:');
  print('Total de itens comprados: ${produto1.qtdVendida}');
  print('Total de itens vendidos: ${produto1.qtdVendida}');
  pularLinha();
  print('Receita gerada com o produto ${produto1.nome}: ${produto1.verReceitaGerada()
      .toStringAsFixed(2)}');
  print('Produto em estoque do produto ${produto1.nome}: ${produto1.qtdEstoque}');
}


