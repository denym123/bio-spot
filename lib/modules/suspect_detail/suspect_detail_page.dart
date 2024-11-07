import 'package:biospot/core/widgets/default_input_field.dart';
import 'package:biospot/core/widgets/default_single_dropdown_button.dart';
import 'package:biospot/modules/suspect/models/suspect_model.dart';
import 'package:biospot/modules/suspect_detail/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/core.dart';

class SuspectDetailPage extends StatefulWidget {
  final SuspectModel suspectModel;

  const SuspectDetailPage({super.key, required this.suspectModel});

  @override
  State<SuspectDetailPage> createState() => _SuspectDetailPageState();
}

class _SuspectDetailPageState
    extends PageLifeCycleState<SuspectDetailController, SuspectDetailPage> {
  @override
  Map<String, dynamic>? get params => {
        'suspect': widget.suspectModel,
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhamento da suspeita',
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
                              "Detalhes da suspeita",
                              style: context.textStyles.semiBold16,
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                controller.getSuspect(widget.suspectModel.id!);
                              },
                              icon: Icon(Icons.refresh,
                                  color: context.colors.primary),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Notas: ${controller.suspectModel?.notes ?? ''}",
                          style: context.textStyles.regular,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Descrição: ${controller.suspectModel?.processInfo?.description ?? ''}",
                          style: context.textStyles.regular,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Situação: ${controller.suspectModel?.status?.name ?? ''}",
                          style: context.textStyles.regular,
                        ),
                        SizedBox(height: 16.h),
                        if (controller.suspectModel?.status?.name !=
                                "Confirmada" &&
                            controller.suspectModel?.status?.name !=
                                "Descartada") ...[
                          Wrap(
                            spacing: 16.w,
                            children: [
                              if (controller.suspectModel?.actions !=
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
                                              title: const Text("Confirmar"),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  DefaultInputField(
                                                      multiArea: true,
                                                      label: "Notas (opcional)",
                                                      controller: controller
                                                          .notesController),
                                                  const Text(
                                                      "Tem certeza que deseja confirmar a suspeita?"),
                                                  DefaultSingleDropdownButton(
                                                      required: true,
                                                      label: "Tipos de praga",
                                                      value: null,
                                                      onChanged: (val) {
                                                        controller
                                                                .selectedPlagueType =
                                                            val;
                                                      },
                                                      items: controller
                                                          .plagueTypes)
                                                ],
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Modular.to.pop();
                                                      controller.confirmSuspect(
                                                          widget.suspectModel
                                                              .id!);
                                                    },
                                                    child: const Text(
                                                        "Confirmar")),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child:
                                                        const Text("Cancelar")),
                                              ],
                                            );
                                          });
                                    },
                                    child: const Text("Confirmar suspeita")),
                              ],
                              if (controller.suspectModel?.actions !=
                                  "observer") ...[
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.w)),
                                      backgroundColor: context.colors.error,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              backgroundColor: Colors.white,
                                              title: const Text(
                                                "Descartar suspeita",
                                              ),
                                              content: const Text(
                                                "Tem certeza que deseja descartar esta suspeita?",
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Cancelar"),
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      controller.deleteSuspect(
                                                          widget.suspectModel
                                                              .id!);
                                                    },
                                                    child: const Text(
                                                        "Descartar",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.red))),
                                              ],
                                            );
                                          });
                                    },
                                    child: const Text("Descartar suspeita")),
                              ],
                            ],
                          ),
                        ]
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
