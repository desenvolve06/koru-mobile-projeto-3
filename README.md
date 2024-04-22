### Desafio 3 - Módulo 3 :books:

Este projeto foi desenvolvido em Android Studio e Visual Studio Code :

Hedgehog | 2023.1.1 Patch 2
Build #AI-223.8836.35.2231.10811636
Java JDK 17

Visual Studio Code
Version: 1.88.1 (system setup)
Commit: e170252f762678dec6ca2cc69aba1570769a5d39
Date: 2024-04-10T17:41:02.734Z
Electron: 28.2.8
ElectronBuildId: 27744544
Chromium: 120.0.6099.291
Node.js: 18.18.2
V8: 12.0.267.19-electron.0
OS: Windows_NT x64 10.0.22631

## Escopo do projeto

A empresa O Boticário deseja automatizar o controle de compra e venda de seus
produtos, fornecendo aos clientes e revendedores um resumo de suas compras e vendas.

- Problemas a serem resolvidos

1. Ausência de um sistema: A empresa precisa de um sistema automatizado composto por
   entidades do mundo real: clientes, revendedores e produtos.
2. Falta de transparência das compras e vendas: Para resolver esse problema, o sistema
   deverá registrar e fornecer aos clientes e revendedores os dados das suas compras e vendas

O sistema contará com 5 classes e utiliza os conceitos de (POO), seus 4 pilares e lógica de programação na linguagem Dart.

**Classe Produto** possui os seguintes **atributos**:
* nome (tipo: String): Representa o nome do produto;
* valor (tipo: double): Representa o preço do produto;
* qtdEmEstoque (tipo: int): Representa a quantidade do produto em estoque.;
* qtdVendida (tipo: int): Representa quantos produtos daquele foram vendidos.

**Métodos**
* realizarVenda() - Este método simula o processo de venda de um produto, verificando se há
  estoque disponível antes de realizar a venda e atualizando as quantidades vendidas e em
  estoque onforme necessário. A exceção é lançada caso não haja estoque disponível para a
  venda do produto. O método continuará realizando a venda do produto caso haja aquele produto em
  estoque. Caso não haja, ao invés de realizar um print,  lança uma exceção com a frase
  que estava sendo printada.

* verReceitaGerada() - Este método calcula a receita gerada pelas vendas do produto
  multiplicando a quantidade vendida pelo valor do produto e retorna o resultado.
------------------------------------------------------------------------------------------------
**Classe Pessoa** possui os seguintes **atributos**:

* nome (tipo: String): Representa o nome da pessoa;
* cpf (tipo: String): Representa o cpf da pessoa
* DateTime dataNascimento: Representa a data de nascimento da pessoa
* idade(tipo: int): Representa a idade da pessoa
* Genero (tipo: Genero) : Representa o gênero da pessoa. Contem os seguintes gênero: feminino,
  masculino e outro.

**Métodos**
* falar() - recebe um parâmetro  (tipo: String): representa o que a pessoa está falando.Este
  método recebe um parâmetro do tipo String, que representa a fala da pessoa, e realizar um print
  dessa conversa.
* calcularIdade() - Este método deve calcular a idade da pessoa com base na data atual e
  na sua data de nascimento.
* maiorIdade() - Ao xecutar o método maior idade, ele mostra se a pessoa é maior de idade ou não
  e retorna uma mensagem caso seja ou não.
* termometroDoHumor() - O método recebe um parâmetro do tipo Humor, que será um
  dos humores escritos no enum Humor. O método utiliza um switch/case, observando qual humor foi
  recebido. Para cada humor, deverá ser printado uma frase diferente de acordo.
------------------------------------------------------------------------------------------------

**Classe Revendedor** herda de Pessoa epossui os seguintes **atributos**:
* matrícula (tipo: String): Representa a matrícula da pessoa revendedora.
* produtosVendidos (tipo: Array de Produtos): Representa os produtos vendidos por aquele revendedor.
* porcentagemLucro (tipo: double): Representa a porcentagem de lucro em cima de cada produto vendido
  por aquele revendedor.

**Métodos**
* falar(): O método continua recebendo o parâmetro do tipo String, que
  representa a fala da pessoa. Foi implemetado um override em cima do código falar com switch/case recebendo como parâmetro o enum Genero.
* venderProduto(),Parâmetros: produto (tipo: Produto): representa o produto que o
  revendedor está vendendo - Método responsável por realizar uma venda de um produto.
  O método recebe um parâmetro do tipo Produto, verifica se tem o produto em estoque e então: Chama o método realizarVenda() daquele
  produto recebido e adicionar o produto na array de produtos vendidos daquele revendedor, e incremento
* calcularTotalVendido() : Método responsável por calcular e retornar o total em reais vendidos
  por aquele revendedor.
* calcularMediaProdutosVendidos(): Método responsável por calcular e retornar a média aritmética
  em reais dos produtos vendidos por aquele revendedor. Foi utilizado um ternário para verificar se
  a lista _produtos vendidos estiver vazio. Se estiver vazia, a função retorna zero, caso contrário,
  calcula a média dos produtos vendidos.
* calcularLucro() Método responsável por calcular e retornar o lucro em reais obtido por aquele
  revendedor.
* verResumo() Método que utiliza as funções criadas anteriormente e realiza um print do resumo
  de total vendido, média aritmética e lucro obtido

------------------------------------------------------------------------------------------------

**Classe Cliente** herda de Pessoa e possui os seguintes **atributos**:

* dinheiro (tipo: double): Representa a quantia em dinheiro que o cliente possui.
* produtosComprados (tipo: Array de Produtos): Representa os produtos comprados por aquele cliente.

- **Métodos**
* falar (sobrescrito): O método continua recebendo o parâmetro do tipo String, que representa a
  fala da pessoa. e faz um print da fala especificando que é um cliente que está falando.

* adicionarDinheiro(): Parâmetros: valor (tipo: double): representa o valor de dinheiro que se está
  adicionando na carteira daquele cliente - Método responsável por adicionar dinheiro na carteira de
  um cliente. O método  recebe o parâmetro (valor) do tipo double e então soma o valor recebido
  por parâmetro ao valor já existente no atributo dinheiro daquele cliente.Realiza um print dizendo
  quanto a pessoa tem no total após o acréscimo.

* comprarProduto(): Parâmetros: produto (tipo: Produto): representa o produto que o cliente está
  comprando revendedor (tipo: Revendedor): representa o revendedor com o qual o cliente está comprando
  aquele produto - Método responsável por realizar uma compra de um produto com um revendedor.
  O método recebe um parâmetro do tipo Produto e um do tipo Revendedor e verifica se aquele
  cliente possui dinheiro suficiente para comprar aquele produto, de acordo com o seu valor:
  Caso possua: Chama o método venderProduto daquele revendedor; Diminui o valor do produto do valor do
  dinheiro do cliente; Adiciona o produto na array de produtos comprados por aquele cliente. Caso não
  possua: realiza um print dizendo que a pessoa não possui dinheiro suficiente pra comprar aquele
  produto,adiciona pontos a cada compra.

* calcularTotalGasto() : Método responsável por calcular e retornar o total em reais gastos por
  aquele cliente. Utiliza função fold() para iterar sobre a lista _produtos comprados e acumular a soma de valores dos produtos.

* calcularMediaProdutosComprados(): Método responsável por calcular e retornar a média aritmética em
  reais dos produtos comprados por aquele cliente.

* verResumo(): Método que utiliza as funções criadas anteriormente e realiza um print do resumo de
  total gasto e média aritmética.

* ordenarProdutosComprados(): Método responsável ordenar a lista de produtos comprados com base
  no nome dos produtos.

* verProdutosComprados(): Método responsável realizar um print dos produtos comprados em ordem
  alfabética, juntamente com os seus valores.

* calcularTotalPontos():  que mostra a quantidade de pontos necessários.

* trocarPontosPorBrinde(): Este método é responsável por trocar os pontos acumulados por um brinde,
  chamando o método realizarTroca do revendedor. verificar se aquele cliente possui pontos suficiente
  para a trocar por aquele produto. Caso não possua pontos suficientes realiza um print dizendo que a
  pessoa nãopossui pontos suficientes pra trocar por aquele produto. Caso possua Chamar o método
  realizarTroca daquele revendedor. No sucesso da troca. Diminui a quantidade de pontos necessárias
  para a troca daquele brinde da quantidade de pontos que o cliente possui. Adiciona o brinde na array
  de brindesrecebidos por aquele cliente. Na falha da troca (caso tenha recebido exceção): realiza um
  print da exceção.

* ordenarBrindes(): Método responsável ordenar a lista de brindes recebidos com base no
  nome dos brindes.

* verBrindes(): Se a lista tiver vaiza realizará um print avisando, caso não, executará o
  OrdenasBrindes() iterando sobre a lista.

------------------------------------------------------------------------------------------------

**Classe Brinde** possui os seguintes **atributos**:

* nome (tipo: String): Representa o nome do brinde.
* pontosNecessarios (tipo: int): Representa a quantidade de pontos necessários que um(a) cliente
  precisa ter para conseguir trocar por esse brinde.
* qtdEmEstoque (tipo: int): Representa a quantidade do produto em estoque (exemplo: 5).

- **Métodos**
* consultarPontosNecessarios(): O método  realiza um print de uma frase dizendo quantos pontos são
  necessários para conseguir aquele brinde.

* realizarTroca (): O método verifica se ainda há aquele produto em estoque. Caso haja, Diminui
  em 1 a quantidade no estoque; realiza um print dizendo que a troca foi realizada e que a pessoa
  ganhou aquele brinde. Caso não haja, lança uma exceção dizendo que não temos o produto em
  estoque.

O projeto contem um arquivo utils que contém funções para imprimir os resultado.

Documentação :bulb:

[Documentation Linguagem dart](https://dart.dev/language)

[Padrões de commit](https://github.com/iuricode/padroes-de-commits)

[Trello - R6](https://trello.com/b/RKc77YOX/grupo-6)


