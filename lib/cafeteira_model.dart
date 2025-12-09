class Cafeteira {
  bool ligada = false;
  int nivelAguaMl;
  int nivelGraosG;
  static const int capacidadeMaximaAguaMl = 2000;
  static const int capacidadeMaximaGraosG = 500;

  Cafeteira(this.nivelAguaMl, this.nivelGraosG);

  void ligar(){
    if (!ligada) {
      ligada = true;
      print("Cafeteira ligada. Pronta para uso!");
    } else {
      print("Cafeteira já está ligada.");
    }
  }
  void desligar(){
    if (ligada) {
      ligada = false;
      print("Cafeteira desligada.");
    } else {
      print("Cafeteira já está desligada.");
    }
  }

  void adicionarAgua(int quantidade){
    nivelAguaMl += quantidade;
    if (nivelAguaMl > capacidadeMaximaAguaMl) {
      nivelAguaMl = capacidadeMaximaAguaMl;
      print("Nível máximo de água atingido.");
    }
    print("Nível de água: $nivelAguaMl ml");
  }

  void adicionarGraos(int quantidade) {
    if (nivelGraosG + quantidade > capacidadeMaximaGraosG) {
      nivelGraosG = capacidadeMaximaGraosG;
      print('Moedor cheio. Grãos no máximo!');
    } else {
      nivelGraosG += quantidade;
    }
    print('Nível de grãos atual: $nivelGraosG g.');
  }
}

class CafeteiraSmart extends Cafeteira {
  String modoPreparoAtual = "Suave";
  Duration tempoPreparoPadrao = const Duration(seconds: 30);

  CafeteiraSmart(super.nivelAguaMl, super.nivelGraosG);

  void selecionarModo(String novoModo){
    modoPreparoAtual = novoModo;
    print("Modo de preparo alterado para: $modoPreparoAtual");
  }

  void iniciarPreparo(int aguaNecessaria, int graosNecessarios){
    if (!ligada) {
      print("A cafeteira está desligada. Por favor, ligue-a antes de iniciar o preparo.");
      return;
    }
    if(ligada) {
      print("Cafeteira está ligada. Iniciando preparo...");
    }
    
    if (nivelAguaMl < aguaNecessaria || nivelGraosG < graosNecessarios) {
      print("Nível de água ou grãos insuficiente para o preparo. Adicione mais água ou grãos.");
      return;
    }

    print('Preparando café no modo $modoPreparoAtual...');

    nivelAguaMl -= aguaNecessaria;
    nivelGraosG -= graosNecessarios;

    print("Iniciando preparo do café no modo $modoPreparoAtual. Tempo estimado: ${tempoPreparoPadrao.inSeconds} segundos.");
    print("Nível restante - Água: $nivelAguaMl ml, Grãos: $nivelGraosG g");
  }

}