// OfferscreenItemWidget
import 'package:spm/pages/visual_fatigue_homePage.dart';

import '../core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OfferscreenItemWidget extends StatelessWidget {
  const OfferscreenItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VisualFatigueTestPage()),
        );
      },
      child: SizedBox(
        height: 206.v,
        width: 343.h,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgPromotionImage,
              height: 206.v,
              width: 343.h,
              radius: BorderRadius.circular(
                5.h,
              ),
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 24.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 209.h,
                      child: Text(
                        "Visual Fatigue Test",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.headlineSmall!.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ),
                    SizedBox(height: 31.v),
                    Row(children: [
                      Text(
                        "A comprehensive assessment designed to measure \nthe strain on your eyes caused by prolonged \n  screen exposure.",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
