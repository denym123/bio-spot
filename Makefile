env ?=
apk:
ifdef env
	@fvm flutter build apk --target lib/main_$(env).dart --flavor $(env) --release
else
	@fvm flutter build apk --release --flavor prd -t lib/main.dart
endif

mobx:
	@fvm flutter pub run build_runner watch -d

clean:
	@fvm flutter clean && fvm flutter pub get

bundle:
	@fvm flutter build appbundle --flavor prd -t lib/main.dart

# Comando para criação de um módulo
# Nome do módulo
MODULE_NAME=${n}

# Diretórios e arquivos que serão criados
MODULE_DIR=lib/modules/$(MODULE_NAME)
BARREL_FILE=$(MODULE_DIR)/$(MODULE_NAME).dart
CONTROLLER_FILE=$(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
CONTROLLER_BARREL_FILE=$(MODULE_DIR)/controllers/controllers.dart
REPOSITORY_FILE=$(MODULE_DIR)/repositories/$(MODULE_NAME)_repository.dart
REPOSITORY_BARREL_FILE=$(MODULE_DIR)/repositories/repositories.dart
PAGE_FILE=$(MODULE_DIR)/$(MODULE_NAME)_page.dart
MODULE_FILE=$(MODULE_DIR)/$(MODULE_NAME)_module.dart
WIDGETS_BARREL_FILE=$(MODULE_DIR)/widgets/widgets.dart
APP_MODULE_FILE=lib/app/app_module.dart

# Função para converter snake_case para CamelCase com primeira letra maiúscula
capitalize_camelcase = $(shell echo $(MODULE_NAME) | awk -F '_' '{for(i=1;i<=NF;i++){printf toupper(substr($$i,1,1)) tolower(substr($$i,2))}}')

module:
	@if [ -z "$(MODULE_NAME)" ]; then \
		echo "Você precisa informar o nome do módulo. Ex.: make module n=home"; \
		exit 1; \
	else \
		mkdir -p $(MODULE_DIR); \
		touch $(BARREL_FILE); \
		echo "export 'controllers/controllers.dart';\nexport 'repositories/repositories.dart';\nexport 'widgets/widgets.dart';\nexport '$(MODULE_NAME)_module.dart';\nexport '$(MODULE_NAME)_page.dart';" >> $(BARREL_FILE); \
		mkdir -p $(MODULE_DIR)/widgets; \
		touch $(WIDGETS_BARREL_FILE); \
		mkdir -p $(MODULE_DIR)/controllers; \
		touch $(CONTROLLER_BARREL_FILE); \
		echo "export '$(MODULE_NAME)_controller.dart';" >> $(CONTROLLER_BARREL_FILE); \
		touch $(CONTROLLER_FILE); \
		echo "import 'package:mobx/mobx.dart';\n\nimport '../../../core/core.dart';\n\npart '$(MODULE_NAME)_controller.g.dart';\n\nclass $(capitalize_camelcase)Controller = $(capitalize_camelcase)ControllerBase\n    with _\$$$(capitalize_camelcase)Controller;\n\nabstract class $(capitalize_camelcase)ControllerBase with Store, ControllerLifeCycle {\n  \n}" >> $(CONTROLLER_FILE); \
		mkdir -p $(MODULE_DIR)/repositories; \
		touch $(REPOSITORY_BARREL_FILE); \
		echo "export '$(MODULE_NAME)_repository.dart';\n" >> $(REPOSITORY_BARREL_FILE); \
		touch $(REPOSITORY_FILE); \
		echo "import 'package:dio/dio.dart';\n\nimport '../../../core/core.dart';\nimport '../../$(MODULE_NAME)/$(MODULE_NAME).dart';\n\nclass $(capitalize_camelcase)Repository extends RepositoryLifeCycle {\n  \n}" >> $(REPOSITORY_FILE); \
		touch $(PAGE_FILE); \
		echo "import 'package:flutter/material.dart';\n\nimport '../../core/core.dart';\nimport '$(MODULE_NAME).dart';\n\n class $(capitalize_camelcase)Page extends StatefulWidget {\n  const $(capitalize_camelcase)Page({super.key});\n\n  @override\n  State<$(capitalize_camelcase)Page> createState() => _$(capitalize_camelcase)PageState();\n}\n\nclass _$(capitalize_camelcase)PageState extends PageLifeCycleState<$(capitalize_camelcase)Controller, $(capitalize_camelcase)Page> {\n  @override\n  Widget build(BuildContext context) {\n    return const Scaffold();\n  }\n}" >> $(PAGE_FILE); \
		touch $(MODULE_FILE); \
		echo "import 'package:flutter_modular/flutter_modular.dart';\nimport '$(MODULE_NAME).dart';\n\n class $(capitalize_camelcase)Module extends Module {\n  @override\n  void binds(i) {\n    i.addLazySingleton($(capitalize_camelcase)Controller.new);\n    i.add($(capitalize_camelcase)Repository.new);\n  }\n\n  @override\n  void routes(r) {\n    r.child(\n      Modular.initialRoute,\n      child: (context) => const $(capitalize_camelcase)Page()\n    );\n  }\n}" >> $(MODULE_FILE); \
		echo "Criados os arquivos necessários para o módulo $(MODULE_NAME)"; \
		git add .; \
	fi