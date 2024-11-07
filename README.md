
# Bio Spot

## Iniciando Projeto
### Versão do Flutter

Versão: 3.24.3

### Instalação do projeto
1. Clone o repositório: ```bash git clone https://github.com/denym123/bio-spot.git ```
3. Navegue até o diretório do projeto: ```cd biospot```
2. Caso nao tenha a versao do projeto do flutter, a instale usando o fvm:  ```fvm install 3.24.3```
4. Escolha a versao do flutter que quer usar utilizando o fvm:  ```fvm use 3.24.3```
4. Instale as dependências: ```fvm flutter pub get```
5. Execute o projeto: ```fvm flutter run --target lib/main```


## Organização da Arquitetura do Projeto

### Organização das Pastas e Módulos

O projeto está organizado de forma a garantir escalabilidade e facilidade de manutenção. A estrutura das pastas é a seguinte:

```plaintext  
biospot/  
├── lib/  
│   ├── app/  
│   │   ├── app.dart  
│   │   ├── app_module.dart  
│   │   ├── app_widget.dart  
│   ├── core/  
│   │   ├── configs/  
│   │   ├── enums/  
│   │   ├── exceptions/  
│   │   └── ...  
│   ├── global_modules/  
│   │   ├── core/  
│   │   │   └── core_module.dart  
│   ├── modules/  
│   │   ├── moduleA/  
│   │   │   ├── controllers/  
│   │   │   ├── models/  
│   │   │   ├── repositories/  
│   │   │   ├── widgets/  
│   │   │   ├── moduleA_page.dart  
│   │   │   ├── moduleA_module.dart  
│   │   ├── moduleB/  
│   │   ├── moduleC/  
│   │   └── ...  
│   └── main.dart  
├── test/  
└── pubspec.yaml  
```  

### Barrels no Flutter

Barrels são arquivos Dart que reexportam outros arquivos para simplificar e organizar importações. Eles permitem que você agrupe múltiplos arquivos em um único ponto de importação, facilitando a manutenção e a legibilidade do código. No contexto deste projeto, `app.dart` atua como um barrel file para a pasta `app`.

#### Exemplo de Barrel
```dart  
export 'app_module.dart';
export 'app_widget.dart';  
```  

Ao usar o barrel `app.dart`, outros arquivos no projeto podem simplesmente importar `app.dart` em vez de importar `app_module.dart` e `app_widget.dart` separadamente:

```dart  
import 'package:my_project/app/app.dart';  
```  

### Estrutura das Camadas

#### Camada `app`
A camada `app` contém os arquivos principais da aplicação. O arquivo `app.dart` atua como um "barrel file", exportando os principais componentes desta camada:
- **app.dart**: Barrel file para a pasta `app`, exportando `app_module.dart` e `app_widget.dart`.
- **app_module.dart**: Configuração dos módulos principais da aplicação.
- **app_widget.dart**: Definição do widget raiz da aplicação.

#### Camada `core`
Agrupa os elementos centrais e compartilhados do projeto, como configurações, enums, exceções, e outros componentes que serão utilizados por diferentes partes da aplicação:
- **configs/**: Arquivos de configuração.
- **enums/**: Definição de enums utilizados na aplicação.
- **exceptions/**: Definição de exceções personalizadas.
- **...**: Outras pastas e arquivos centrais.

#### Camada `modules`
Contém os módulos específicos da aplicação, organizados de forma paralela para facilitar a escalabilidade e manutenção. Cada módulo segue uma estrutura consistente, incluindo camadas de controllers, repositories, models, widgets, page e module. Por exemplo:

##### Estrutura de um Módulo (`moduleA`)
```plaintext  
moduleA/  
├── controllers/  
│   └── moduleA_controller.dart  
├── models/  
│   └── moduleA_model.dart  
├── repositories/  
│   └── moduleA_repository.dart  
├── widgets/  
│   └── moduleA_widget.dart  
├── moduleA_page.dart  
├── moduleA_module.dart  
```  

- **controllers/**: Controladores que gerenciam a lógica do módulo.
- **models/**: Modelos de dados específicos do módulo.
- **repositories/**: Classes que lidam com a comunicação com APIs ou outras fontes de dados.
- **widgets/**: Widgets específicos do módulo.
- **dtos/**:  é um objeto simples usado para transferir dados entre partes de um sistema. especificos do módulo
- **moduleA_page.dart**: Página principal do módulo.
- **moduleA_module.dart**: Configuração e injeção de dependências do módulo.

### Arquivos de Entrada
- **main.dart**: Ponto de entrada principal da aplicação.

### Gerenciamento de Dependências
- **pubspec.yaml**: Arquivo de gerenciamento de dependências do Dart/Flutter.
