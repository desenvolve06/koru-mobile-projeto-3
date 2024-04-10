import '../enums/enums.dart';

class Pessoa{
  String nome;
  String cpf;
  final DateTime dataNascimento;
  late  int _idade;
  final Genero? genero;

  Pessoa(this.genero, {required this.nome, required this.cpf, required this.dataNascimento}){
    _idade = _calcularIdade();
  }

  @override
  int _calcularIdade() {
    int idade = DateTime.now().year - dataNascimento.year;
    if (DateTime.now().month < dataNascimento.month ||
        (DateTime.now().month == dataNascimento.month &&
            DateTime.now().day < dataNascimento.day)) {
      idade--;
    }
    return idade;
  }

  @override
  void maiorIdade(){
    if (_idade >= 18) {
      print('$nome tem $_idade anos, portanto é maior de idade.');
    } else {
      print('$nome tem $_idade anos, portanto é menor de idade.');
    }
  }

  @override
  void falar(String texto){

    print('${this.nome} diz: ${texto}');
  }
}
