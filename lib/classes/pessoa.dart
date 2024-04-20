import '../enums/enums.dart';

class Pessoa{
  final String nome;
  final String cpf;
  final DateTime dataNascimento;
  late final int _idade;
  final Genero genero;

  Pessoa({required this.nome, required this.cpf, required this.dataNascimento, required this.genero}){
   _idade = _calcularIdade();
  }

  
  int _calcularIdade() {
    int idade = DateTime.now().year - dataNascimento.year;
    if (DateTime.now().month < dataNascimento.month ||
        (DateTime.now().month == dataNascimento.month &&
            DateTime.now().day < dataNascimento.day)) {
      idade--;
    }
    return idade;
  }

  
  void maiorIdade(){
    if (_idade >= 18) {
      print('$nome tem $_idade anos, portanto é maior de idade.');
    } else {
      print('$nome tem $_idade anos, portanto é menor de idade.');
    }
  }

  
  void falar(String texto){

    print('${this.nome} diz: ${texto}');
  }
}