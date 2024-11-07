import 'package:biospot/core/widgets/default_drawer.dart';
import 'package:biospot/core/widgets/primary_small_button.dart';
import 'package:biospot/modules/plague/controllers/controllers.dart';
import 'package:biospot/modules/plague/widgets/plague_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/core.dart';
import '../../core/routes/app_routes.dart';

class PlaguePage extends StatefulWidget {
  const PlaguePage({super.key});

  @override
  State<PlaguePage> createState() => _PlaguePageState();
}

class _PlaguePageState
    extends PageLifeCycleState<PlagueController, PlaguePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pragas',
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
            SizedBox(height: 16.h),
            Text(
              "Todas as pragas",
              style: context.textStyles.medium,
            ),
            SizedBox(height: 16.h),
            Observer(builder: (context) {
              return Expanded(
                child: !controller.isLoading
                    ? RefreshIndicator(
                        onRefresh: () {
                          return controller.fetchPlagues();
                        },
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              var plague = controller.plagues[index];
                              return PlagueTile(
                                onPressed: () {
                                  AppRoutes.goToPlagueDetail(plague);
                                },
                                plagueName: plague.name ?? '',
                                plagueStatus: plague.status,
                                plagueDescription: plague.description ?? '',
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 16.h);
                            },
                            itemCount: controller.plagues.length),
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
