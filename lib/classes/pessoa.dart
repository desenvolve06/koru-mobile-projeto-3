import '../enums/enums.dart';
import '../utils.dart';

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

  void termometroDoHumor(Humor humor) {
    String humorDoDia;
    switch (humor) {
      case (Humor.RADIANTE):
        humorDoDia = 'Que bom que você está radiante $nome!';
        break;
      case (Humor.ANSIOSA):
        humorDoDia = 'Pare um pouco, conte até mil e respire,$nome.';
        break;
      case (Humor.CANSADA):
        humorDoDia =
        'Recarregue as suas baterias e volte com força total,$nome.';
        break;
      case (Humor.FELIZ):
        humorDoDia =
        'Quem bom que você está feliz!! $nome seja feliz enquanto pode!';
        break;
      case (Humor.TRISTE):
        humorDoDia =
        'Não fique triste que ainda pode piorar. $nome Te anima e siga em frente. ';
        break;
      case (Humor.ESTRESSADA):
        humorDoDia = 'No stress! $nome fica mna boa!';
        break;
      default:
        humorDoDia = '';
    }
    imprimirNomeEHumor(humorDoDia);
  }
}