import 'package:biospot/core/core.dart';
import 'package:flutter/material.dart';

class PlagueTile extends StatelessWidget {
  final String plagueName;
  final StatusModel? plagueStatus;
  final String plagueDescription;
  final VoidCallback? onPressed;

  const PlagueTile(
      {super.key,
      required this.plagueName,
      required this.plagueDescription,
      required this.plagueStatus,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16.r),
          elevation: 0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(8.w),
          ),
        ),
        onPressed: onPressed,
        child: Container(
          constraints: const BoxConstraints(
            minWidth: double.infinity,
          ),
          child: Row(
            children: [
              Icon(
                Icons.bug_report,
                size: 32.r,
                color: Colors.red,
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(plagueName,
                        style: context.textStyles.medium
                            .copyWith(color: context.colors.dark)),
                    Text(plagueDescription),
                    Row(
                      children: [
                        Text(plagueStatus?.name ?? '',
                            style: context.textStyles.bold16.copyWith(
                                fontSize: 16.sp,
                                color: plagueStatus?.color.toColor() ??
                                    context.colors.primary)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
