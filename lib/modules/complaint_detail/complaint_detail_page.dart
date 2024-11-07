import 'package:biospot/core/widgets/default_input_field.dart';
import 'package:biospot/modules/complaint/models/complaint_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/core.dart';
import 'complaint_detail.dart';

class ComplaintDetailPage extends StatefulWidget {
  final ComplaintModel complaint;

  const ComplaintDetailPage({super.key, required this.complaint});

  @override
  State<ComplaintDetailPage> createState() => _ComplaintDetailPageState();
}

class _ComplaintDetailPageState
    extends PageLifeCycleState<ComplaintDetailController, ComplaintDetailPage> {
  @override
  Map<String, dynamic>? get params => {
        'complaint': widget.complaint,
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhamento da denúncia',
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
                              "Detalhes da denúncia",
                              style: context.textStyles.semiBold16,
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                controller.getComplaint(widget.complaint.id);
                              },
                              icon: Icon(Icons.refresh,
                                  color: context.colors.primary),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Descrição: ${controller.complaint?.processInfo?.description ?? ''}",
                          style: context.textStyles.regular,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Data: ${controller.complaint?.startedAt.replaceAll('-', '/')}",
                          style: context.textStyles.regular,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Situação: ${controller.complaint?.status?.name ?? ''}",
                          style: context.textStyles.regular,
                        ),
                        SizedBox(height: 16.h),
                        Wrap(
                          spacing: 16.w,
                          children: [
                            if (controller.complaint?.actions !=
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
                                                    "Tem certeza que deseja confirmar a denúncia?"),
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Modular.to.pop();
                                                    controller.confirmComplaint(
                                                        widget.complaint.id);
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
                            if (controller.complaint?.actions !=
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
                                              "Descartar denúncia",
                                            ),
                                            content: const Text(
                                              "Tem certeza que deseja descartar esta denúncia?",
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
                                                    controller.deleteComplaint(
                                                        widget.complaint.id);
                                                  },
                                                  child: const Text(
                                                    "Descartar",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  )),
                                            ],
                                          );
                                        });
                                  },
                                  child: const Text("Descartar denúncia")),
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
