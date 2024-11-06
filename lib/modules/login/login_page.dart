import 'package:biospot/core/widgets/default_input_field.dart';
import 'package:biospot/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/core.dart';
import '../../core/generated/assets.dart';
import 'login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends PageLifeCycleState<LoginController, LoginPage>
    with FormValidator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    SvgPicture.asset(
                      Assets.imagesLogoHorizontal,
                      color: context.colors.primary,
                      height: 100.h,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    const Row(
                      children: [
                        Text("Para entrar coloque suas credenciais"),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    DefaultInputField(
                      label: "Usuário",
                      controller: controller.usernameController,
                      validator: isNotEmpty,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    DefaultInputField(
                      label: "Senha",
                      obscureText: true,
                      controller: controller.passwordController,
                      validator: isNotEmpty,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Observer(builder: (context) {
                      return PrimaryButton(
                        label: "Entrar",
                        isLoading: controller.isLoading,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.login();
                          }
                        },
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("Não possui uma conta?"),
                        TextButton(
                          onPressed: () {},
                          child: Text("Cadastre-se",
                              style: context.textStyles.bold.copyWith(
                                  color: context.colors.primary,
                                  fontSize: 14.sp)),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
