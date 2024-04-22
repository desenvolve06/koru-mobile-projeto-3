import 'classes/brinde.dart';
import 'classes/cliente.dart';
import 'classes/pessoa.dart';
import 'classes/produto.dart';
import 'classes/revendedor.dart';
import 'enums/enums.dart';
import 'utils.dart';

main() {
  /* Declaração de objetos Revendedor */
  Revendedor revendedor1 = Revendedor(
      nome: "Jorge",
      cpf: "064646464",
      dataNascimento: DateTime(2000, 12, 02),
      genero: Genero.masculino,
      matricula: "123456");
  Revendedor revendedor2 = Revendedor(
      nome: "Ana",
      cpf: "064646464",
      dataNascimento: DateTime.parse('2000-12-02'),
      genero: Genero.feminino,
      matricula: "123456");

  Pessoa pessoa = Pessoa(
      nome: "a",
      cpf: '121',
      dataNascimento: DateTime.parse('2000-12-02'),
      genero: Genero.feminino);
  pessoa.calcularIdade();

  // Criando um cliente
  Cliente cliente1 = Cliente(
      nome: 'Heitor',
      cpf: '1111',
      dataNascimento: DateTime(2000, 12, 02),
      genero: Genero.masculino,
      dinheiro: 400);

  Cliente cliente2 = Cliente(
      nome: 'Carla',
      cpf: '1111',
      dataNascimento: DateTime(2000, 12, 02),
      genero: Genero.feminino,
      dinheiro: 500);

  /* Declaração de objetos Produto */
  Produto produto1 = Produto(
      nome: 'Colônia Floratta Flores Secretas 75ml',
      valor: 133.33,
      qtdEstoque: 9); // Produto
  Produto produto2 = Produto(
      nome: 'Glamour Myriad Desodorante Colônia 75ml',
      valor: 154.90,
      qtdEstoque: 5); // Produto

  Produto produto3 =
      Produto(nome: 'Amore colonia', valor: 100.00, qtdEstoque: 5); // Produto
  Brinde brinde1 = Brinde(
      nome: 'Pó Banana Translúcido 2 Intense 12g',
      pontosNecessarios: 1,
      qtdEmEstoque: 40);
  Brinde brinde2 = Brinde(
      nome: 'Kit Esponjas de Maquiagem 3 unidades',
      pontosNecessarios: 2,
      qtdEmEstoque: 40);

  /* Testes método falar() */
  String textoRevendedor = 'Olá como vai';
  String textoCliente = 'Quero comprar um produto';
  pularLinha();
  revendedor1.falar(textoRevendedor);
  cliente1.falar(textoCliente);

  //Add dinheiro
  cliente1.adicionarDinheiro(1000.0);
  cliente2.adicionarDinheiro(100);
  pularLinha();

//aqui o cliente compra o produto e nele já tem um método que chama o revendedor.venderProduto
  cliente1.comprarProduto(produto1, revendedor1);
  cliente1.comprarProduto(produto2, revendedor1);
  cliente1.comprarProduto(produto3, revendedor1);
  cliente2.comprarProduto(produto3, revendedor1);
  pularLinha();

  pularLinha();
  //Mostra produtos vendidos e estoques dos produtos
  mostrarQtdProdutoEmEstoque(produto1.nome, produto1.qtdEstoque);
  mostrarQtdVendida(produto1.nome, produto1.qtdVendida, revendedor1.nome);
  mostrarQtdProdutoEmEstoque(produto2.nome, produto2.qtdEstoque);
  mostrarQtdVendida(produto2.nome, produto2.qtdVendida, revendedor1.nome);
  mostrarQtdProdutoEmEstoque(produto3.nome, produto3.qtdEstoque);
  mostrarQtdVendida(produto3.nome, produto3.qtdVendida, revendedor1.nome);

  pularLinha();
  // Receita gerada
  print(
      'Receita gerada com o produto ${produto1.nome}: ${produto1.verReceitaGerada().toStringAsFixed(2)} reais');
  print(
      'Receita gerada com o produto ${produto2.nome}: ${produto2.verReceitaGerada().toStringAsFixed(2)} reais');
  print(
      'Receita gerada com o produto ${produto3.nome}: ${produto3.verReceitaGerada().toStringAsFixed(2)} reais');

  pularLinha();
  // Revendedor | Resumo
  revendedor1.verResumo();
  revendedor1.termometroDoHumor(Humor.feliz);
  revendedor2.verResumo();
  revendedor2.termometroDoHumor(Humor.triste);
  pularLinha();

  //Informações da compra dos clientes | Resumo
  cliente1.verResumo();
  cliente2.verResumo();
  pularLinha();
  cliente1.verProdutosComprados();
  cliente2.verProdutosComprados();
  pularLinha();
  cliente1.termometroDoHumor(Humor.feliz);
  cliente2.termometroDoHumor(Humor.ansiosa);
  revendedor1.termometroDoHumor(Humor.radiante);
  revendedor2.termometroDoHumor(Humor.triste);
  pularLinha();


  cliente1.calcularTotalPontos();
  cliente1.trocarPontosPorBrinde(brinde1);
  cliente1.trocarPontosPorBrinde(brinde2);
  cliente1.verBrindes();
  cliente2.calcularTotalPontos();
  cliente2.trocarPontosPorBrinde(brinde2);
  cliente2.verBrindes();
  cliente2.trocarPontosPorBrinde(brinde1);
  cliente2.verBrindes();

}
