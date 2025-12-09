import 'package:flutter/material.dart';
// Importe o arquivo com as classes que você criou
import 'cafeteira_model.dart'; 

void main() {
  runApp(const CafeteiraApp());
}

class CafeteiraApp extends StatelessWidget {
  const CafeteiraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SmartBrew 3000',
      home: CafeteiraHomePage(), // Nosso StatefulWidget
    );
  }
}

// ----------------------------------------------------
// 1. O StatefulWidget: Armazena a configuração imutável
// ----------------------------------------------------
class CafeteiraHomePage extends StatefulWidget {
  const CafeteiraHomePage({super.key});

  @override
  State<CafeteiraHomePage> createState() => _CafeteiraHomePageState();
}

// ----------------------------------------------------
// 2. O State: Armazena os dados mutáveis e a UI (Interface)
// ----------------------------------------------------
class _CafeteiraHomePageState extends State<CafeteiraHomePage> {
  // Instancia a sua classe de modelo AQUI para que ela pertença ao Estado.
  final CafeteiraSmart minhaCafeteira = CafeteiraSmart(1000, 250); 
  
  // Variável auxiliar para o Slider de adição de água
  double quantidadeAdicionar = 100.0;
  double quantidadeAdicionarGraos = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SmartBrew 3000'),
        backgroundColor: Colors.brown,
      ),
      body: _buildCafeteiraUI(),
    );
  }
  
  // Função para construir o corpo da UI
  Widget _buildCafeteiraUI() {
    // Retorna a estrutura visual aqui
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // -----------------------------------
          // 1. Status da Cafeteira
          // -----------------------------------
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status: ${minhaCafeteira.ligada ? '🔌 LIGADA' : '❌ DESLIGADA'}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: minhaCafeteira.ligada ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('💧 Água: ${minhaCafeteira.nivelAguaMl} ml'),
                  Text('🌰 Grãos: ${minhaCafeteira.nivelGraosG} g'),
                  Text('⚙️ Modo: ${minhaCafeteira.modoPreparoAtual}'),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),

          // -----------------------------------
          // 2. Botão Ligar/Desligar
          // -----------------------------------
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: minhaCafeteira.ligada ? Colors.red : Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            onPressed: () {
              // Chamando setState para que a UI seja reconstruída
              // e reflita a mudança de estado (ligada/desligada)
              setState(() {
                if (minhaCafeteira.ligada) {
                  minhaCafeteira.desligar(); 
                } else {
                  minhaCafeteira.ligar();
                }
              });
            },
            child: Text(
              minhaCafeteira.ligada ? 'DESLIGAR' : 'LIGAR',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),

          const SizedBox(height: 20),
          const Divider(),
          
          // -----------------------------------
          // 3. Slider para Adicionar Água (Interação)
          // -----------------------------------
          Text('Adicionar Água: ${quantidadeAdicionar.round()} ml', style: const TextStyle(fontSize: 16)),
          Slider(
            value: quantidadeAdicionar,
            min: 50,
            max: 500,
            divisions: 9,
            label: '${quantidadeAdicionar.round()} ml',
            // O valor do Slider muda, mas não precisamos de setState aqui, 
            // apenas para atualizar a variável temporária.
            onChanged: (double newValue) {
              setState(() {
                quantidadeAdicionar = newValue;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Quando o botão é pressionado, chamamos o método do nosso modelo
              // e usamos setState para atualizar a tela com o novo nível de água.
              setState(() {
                minhaCafeteira.adicionarAgua(quantidadeAdicionar.round());
              });
            },
            child: const Text('ADICIONAR ÁGUA'),
          ),

          const SizedBox(height: 20),
          const Divider(),

          // -----------------------------------
          // 4. Slider para Adicionar Grãos
          // -----------------------------------
          Text('Adicionar Grãos: ${quantidadeAdicionarGraos.round()} g', style: const TextStyle(fontSize: 16)),
          Slider(
            value: quantidadeAdicionarGraos,
            min: 10, // Mínimo a adicionar
            max: 200, // Máximo de cada vez
            divisions: 19,
            label: '${quantidadeAdicionarGraos.round()} g',
            onChanged: (double newValue) {
              // Atualiza a variável do estado temporariamente
              setState(() {
                quantidadeAdicionarGraos = newValue;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              // IMPORTANTE: Chamamos o método do modelo e usamos setState
              // para forçar a reconstrução da UI e mostrar o novo nível de grãos.
              setState(() {
                minhaCafeteira.adicionarGraos(quantidadeAdicionarGraos.round());
              });
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text('ADICIONAR GRÃOS'),
          ),


          // Espaço para o botão de Preparo
          const Spacer(),
          ElevatedButton(
            onPressed: minhaCafeteira.ligada 
                ? () {
                    setState(() {
                      // Usando valores fixos por enquanto, idealmente viriam de um formulário.
                      minhaCafeteira.iniciarPreparo(200, 20); 
                    });
                  }
                : null, // Desabilita o botão se a cafeteira estiver desligada
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            child: const Text(
              'INICIAR PREPARO (200ml)', 
              style: TextStyle(fontSize: 20, color: Colors.white)
            ),
          ),
        ],
      ),
    );
}
  }
