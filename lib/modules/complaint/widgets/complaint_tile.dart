import 'package:biospot/core/core.dart';
import 'package:flutter/material.dart';

class ComplaintTile extends StatelessWidget {
  final String complaintName;
  final StatusModel? complaintStatus;
  final String complaintDate;
  final VoidCallback? onPressed;

  const ComplaintTile(
      {super.key,
      required this.complaintName,
      required this.complaintDate,
      required this.complaintStatus,
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
                Icons.campaign_rounded,
                size: 32.r,
                color: Colors.red,
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(complaintName,
                        style: context.textStyles.medium
                            .copyWith(color: context.colors.dark)),
                    Text(
                      "Data de suspeita: ${complaintDate.replaceAll('-', "/")}",
                      style: context.textStyles.medium
                          .copyWith(color: context.colors.dark),
                    ),
                    Row(
                      children: [
                        Text(complaintStatus?.name ?? '',
                            style: context.textStyles.bold16.copyWith(
                                fontSize: 16.sp,
                                color: complaintStatus?.color.toColor() ??
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
