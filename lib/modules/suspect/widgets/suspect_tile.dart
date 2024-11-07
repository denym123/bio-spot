import 'package:biospot/core/core.dart';
import 'package:flutter/material.dart';

class SuspectTile extends StatelessWidget {
  final String suspectName;
  final StatusModel? suspectStatus;
  final VoidCallback? onPressed;

  const SuspectTile(
      {super.key,
      required this.suspectName,
      required this.suspectStatus,
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
                Icons.search,
                size: 32.r,
                color: Colors.amber,
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(suspectName,
                        style: context.textStyles.medium
                            .copyWith(color: context.colors.dark)),
                    Row(
                      children: [
                        Text(suspectStatus?.name ?? '',
                            style: context.textStyles.bold16.copyWith(
                                fontSize: 16.sp,
                                color: suspectStatus?.color.toColor() ??
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
