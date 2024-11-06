import 'package:biospot/core/widgets/default_drawer.dart';
import 'package:biospot/core/widgets/primary_small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/core.dart';
import '../../core/routes/app_routes.dart';
import 'suspect.dart';
import 'widgets/suspect_tile.dart';

class SuspectPage extends StatefulWidget {
  const SuspectPage({super.key});

  @override
  State<SuspectPage> createState() => _SuspectPageState();
}

class _SuspectPageState
    extends PageLifeCycleState<SuspectController, SuspectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Suspeitas',
          style: context.textStyles.semiBold16.copyWith(color: Colors.white),
        ),
      ),
      drawer: const DefaultDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimarySmallButton(
                  label: "Nova suspeita",
                  isLoading: false,
                  icon: Icons.add,
                  onPressed: () {
                    AppRoutes.goToNewProcess();
                  },
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              "Minhas ultimas denúncias de suspeitas",
              style: context.textStyles.medium,
            ),
            SizedBox(height: 16.h),
            Observer(builder: (context) {
              return Expanded(
                child: !controller.isLoading
                    ? RefreshIndicator(
                        onRefresh: () {
                          return controller.fetchSuspects();
                        },
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              var suspect = controller.suspects[index];
                              return SuspectTile(
                                onPressed: () {
                                  AppRoutes.goToSuspectDetail(suspect);
                                },
                                complaintDate: suspect.startedAt,
                                complaintName:
                                    suspect.processInfo?.description ?? '',
                                complaintStatus: suspect.status,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 16.h);
                            },
                            itemCount: controller.suspects.length),
                      )
                    : Center(
                        child: LoadingAnimationWidget.stretchedDots(
                            color: context.colors.primary, size: 80.r),
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
