import 'package:biospot/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../generated/assets.dart';
import '../routes/app_routes.dart';
import 'default_drawer_tile.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28.w, 72.h, 0, 0),
            child: Container(
              width: 68.w,
              height: 68.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(28.w, 20.h, 0, 0),
            child: Text(
              Modular.get<UserStore>().userModel?.username ?? "",
              style: context.textStyles.bold.copyWith(
                fontSize: 16.sp,
                color: context.colors.primary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(28.w, 8.h, 0, 0),
            child: Text(
              "Usuário",
              style: context.textStyles.regular.copyWith(
                fontSize: 16.sp,
                color: context.colors.primary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 28.h, 0, 28.h),
            child: Divider(
              thickness: 1.w,
              height: 0,
            ),
          ),
          DefaultDrawerTile(
            leading: const Icon(Icons.search),
            title: "Suspeitas",
            onTap: () {
              AppRoutes.goToSuspect();
            },
          ),
          DefaultDrawerTile(
            leading: const Icon(Icons.warning_amber_rounded),
            title: "Denúncias",
            onTap: () {
              AppRoutes.goToComplaint();
            },
          ),
          DefaultDrawerTile(
            leading: const Icon(Icons.bug_report),
            title: "Pragas",
            onTap: () {
              AppRoutes.goToPlagues();
            },
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 38.h),
            child: ElevatedButton(
              onPressed: () {
                Modular.get<UserStore>().logout();
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shadowColor: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.logout),
                  SizedBox(width: 16.w),
                  Text(
                    "Sair",
                    style: context.textStyles.medium.copyWith(
                      fontSize: 18.sp,
                      color: const Color(0XFFD22929),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
