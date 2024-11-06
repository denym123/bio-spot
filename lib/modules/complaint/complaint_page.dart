import 'package:biospot/core/routes/app_routes.dart';
import 'package:biospot/core/widgets/default_drawer.dart';
import 'package:biospot/core/widgets/primary_small_button.dart';
import 'package:biospot/modules/complaint/complaint.dart';
import 'package:biospot/modules/complaint/widgets/complaint_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/core.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState
    extends PageLifeCycleState<ComplaintController, ComplaintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Denúncias',
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
            Text(
              "Encontrou algum inseto suspeito?",
              style: context.textStyles.semiBold16,
            ),
            Text(
              "Realize uma nova denúncia e ajude-nos a combater esse problema!",
              style: context.textStyles.regular,
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimarySmallButton(
                  label: "Nova denúncia",
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
              "Minhas ultimas denúncias",
              style: context.textStyles.medium,
            ),
            SizedBox(height: 16.h),
            Observer(builder: (context) {
              return Expanded(
                child: !controller.isLoading
                    ? RefreshIndicator(
                        onRefresh: () {
                          return controller.fetchComplaints();
                        },
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              var complaint = controller.complaints[index];
                              return ComplaintTile(
                                onPressed: () {
                                  AppRoutes.goToComplaintDetail(complaint);
                                },
                                complaintDate: complaint.startedAt,
                                complaintName:
                                    complaint.processInfo?.description ?? '',
                                complaintStatus: complaint.status,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 16.h);
                            },
                            itemCount: controller.complaints.length),
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
