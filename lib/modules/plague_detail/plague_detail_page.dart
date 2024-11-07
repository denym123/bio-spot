import 'package:biospot/core/widgets/default_input_field.dart';
import 'package:biospot/modules/plague/models/plague_model.dart';
import 'package:biospot/modules/plague_detail/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/core.dart';

class PlagueDetailPage extends StatefulWidget {
  final PlagueModel plagueModel;

  const PlagueDetailPage({super.key, required this.plagueModel});

  @override
  State<PlagueDetailPage> createState() => _SuspectDetailPageState();
}

class _SuspectDetailPageState
    extends PageLifeCycleState<PlagueDetailController, PlagueDetailPage> {
  @override
  Map<String, dynamic>? get params => {
        'plague': widget.plagueModel,
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhamento da praga',
          style: context.textStyles.semiBold16.copyWith(color: Colors.white),
        ),
      ),
      body: Observer(builder: (context) {
        return controller.isLoading == false
            ? SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: context.colors.grey),
                      borderRadius: BorderRadius.circular(16.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Detalhes da praga",
                              style: context.textStyles.semiBold16,
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                controller.getPlague(widget.plagueModel.id!);
                              },
                              icon: Icon(Icons.refresh,
                                  color: context.colors.primary),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Notas: ${controller.plagueModel?.name ?? ''}",
                          style: context.textStyles.regular,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Descrição: ${controller.plagueModel?.description ?? ''}",
                          style: context.textStyles.regular,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Situação: ${controller.plagueModel?.status?.name ?? ''}",
                          style: context.textStyles.regular,
                        ),
                        SizedBox(height: 16.h),
                        Wrap(
                          spacing: 16.w,
                          children: [
                            if (controller.plagueModel?.actions !=
                                "observer") ...[
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.w)),
                                    backgroundColor: context.colors.primary,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white,
                                            title: const Text("Resolver"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                    "Tem certeza que deseja confirmar a denúncia?"),
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Modular.to.pop();
                                                    controller.confirmPlague(
                                                        widget.plagueModel.id!);
                                                  },
                                                  child:
                                                      const Text("Confirmar")),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child:
                                                      const Text("Cancelar")),
                                            ],
                                          );
                                        });
                                  },
                                  child: const Text("Confirmar denúncia")),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: LoadingAnimationWidget.stretchedDots(
                  color: context.colors.primary,
                  size: 80.r,
                ),
              );
      }),
    );
  }
}
