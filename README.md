# ☕ SmartBrew 3000

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge" alt="License">
</p>

Um aplicativo Flutter que simula uma **cafeteira inteligente** com interface interativa e controle completo dos parâmetros de preparo de café. Projeto educacional desenvolvido para demonstrar conceitos fundamentais de Flutter como StatefulWidget, gerenciamento de estado com `setState()`, e construção de interfaces Material Design responsivas.

---

## 🚀 Features

- ✅ **Controle Liga/Desliga** - Botão interativo com mudança de cor baseada no estado
- 💧 **Gerenciamento de Água** - Slider para adicionar água com validação de capacidade máxima (1000ml)
- 🌰 **Gerenciamento de Grãos** - Slider para adicionar grãos de café com limite de 250g
- ⚙️ **Modos de Preparo** - Três opções: Suave, Médio e Forte
- ☕ **Preparo Inteligente** - Validação de recursos disponíveis antes de iniciar
- 📊 **Status em Tempo Real** - Visualização instantânea dos níveis de água e grãos
- 🎨 **Interface Material Design** - Cards com elevação, cores dinâmicas e feedback visual

---

## 📱 Screenshots

> *Screenshots em breve*

---

## 🛠️ Tecnologias Utilizadas

- **Flutter** - Framework multiplataforma para desenvolvimento mobile
- **Dart** - Linguagem de programação
- **Material Design** - Sistema de design do Google

### Conceitos de Flutter Aplicados:
- `StatefulWidget` e `State`
- Gerenciamento de estado com `setState()`
- Widgets de layout: `Column`, `Row`, `Card`, `Padding`
- Widgets interativos: `Slider`, `ElevatedButton`
- Estilização com `TextStyle` e `EdgeInsets`
- Validação de entrada e lógica de negócios

---

## 📦 Estrutura do Projeto

```
lib/
├── main.dart              # Interface do usuário (UI)
├── cafeteira_model.dart   # Modelo de dados e lógica de negócio
```

### Arquitetura:
- **Separação de Responsabilidades**: UI separada da lógica de negócio
- **Model Class**: `CafeteiraSmart` encapsula estado e comportamento
- **StatefulWidget**: Gerencia estado mutável da interface

---

## 🔧 Instalação e Execução

### Pré-requisitos:
- Flutter SDK (>= 3.5.4)
- Dart SDK (>= 3.5.4)
- Android Studio / VS Code
- Dispositivo físico ou emulador configurado

### Passos:

1. **Clone o repositório:**
```bash
git clone https://github.com/OYanEnrique/smart-brew-3000.git
cd smart-brew-3000
```

2. **Instale as dependências:**
```bash
flutter pub get
```

3. **Execute o app:**
```bash
# Para Windows
flutter run -d windows

# Para Android
flutter run -d android

# Para iOS
flutter run -d ios
```

---

## 🎮 Como Usar

1. **Ligar a Cafeteira**: Pressione o botão "LIGAR" (fica verde quando ligada)
2. **Adicionar Água**: Use o slider para selecionar a quantidade (50-500ml) e clique em "ADICIONAR ÁGUA"
3. **Adicionar Grãos**: Use o slider para selecionar a quantidade (10-200g) e clique em "ADICIONAR GRÃOS"
4. **Iniciar Preparo**: Com a cafeteira ligada e recursos suficientes, clique em "INICIAR PREPARO"

### Validações Automáticas:
- ⚠️ Não permite ligar sem recursos mínimos
- ⚠️ Bloqueia preparo se faltar água ou grãos
- ⚠️ Respeita capacidades máximas dos reservatórios

---

## 📚 Aprendizados

Este projeto demonstra:
- Como usar `StatefulWidget` para gerenciar estado mutável
- Quando e como chamar `setState()` para reconstruir a UI
- Separação entre lógica de negócio (model) e apresentação (view)
- Uso de widgets de layout e composição no Flutter
- Validação de entrada do usuário
- Feedback visual com cores e estados dinâmicos

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para:
1. Fazer fork do projeto
2. Criar uma branch para sua feature (`git checkout -b feature/NovaFeature`)
3. Commitar suas mudanças (`git commit -m 'feat: Adiciona nova feature'`)
4. Fazer push para a branch (`git push origin feature/NovaFeature`)
5. Abrir um Pull Request

---

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## 👨‍💻 Autor

**OYanEnrique**

- GitHub: [@OYanEnrique](https://github.com/OYanEnrique)

---

## 🙏 Agradecimentos

- Flutter Team pela excelente documentação
- Comunidade Flutter Brasil
- Material Design Guidelines

---

<p align="center">
  Feito com ☕ e Flutter
</p>
