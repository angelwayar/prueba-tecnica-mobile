import 'package:flutter/material.dart';

import 'commons/sun_colors.dart';
import 'components/sun_text/sun_text.dart';

class AppBarMinimal extends StatelessWidget implements PreferredSizeWidget {
  final String textTitle;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final VoidCallback? onLeftIconTap;
  final VoidCallback? onRightIconTap;

  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;

  const AppBarMinimal({
    super.key,
    required this.textTitle,
    this.leftIcon,
    this.rightIcon,
    this.onLeftIconTap,
    this.onRightIconTap,
    this.toolbarHeight,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        height: 84,
        padding: const EdgeInsets.fromLTRB(36, 24, 36, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: SunColors.colorWhite,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1,
                      color: Colors.grey.shade200,
                      offset: const Offset(1, 1)),
                  BoxShadow(
                      blurRadius: 1,
                      color: Colors.grey.shade200,
                      offset: const Offset(-1, -1))
                ],
              ),
              child: IconButton(
                icon: Icon(
                  leftIcon ?? Icons.arrow_back_ios_rounded,
                  color: SunColors.titleGreyLight,
                  size: 20,
                ),
                onPressed: onLeftIconTap,
              ),
            ),
            if (rightIcon != null) ...[
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: SunColors.colorWhite,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        color: Colors.grey.shade200,
                        offset: const Offset(1, 1)),
                    BoxShadow(
                        blurRadius: 1,
                        color: Colors.grey.shade200,
                        offset: const Offset(-1, -1))
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    rightIcon,
                    color: SunColors.titleGreyLight,
                    size: 20,
                  ),
                  onPressed: onRightIconTap,
                ),
              ),
            ]
          ],
        ),
      ),
      title: SunText(
        text: textTitle,
        style: Theme.of(context).textTheme.titleMedium!,
      ),
      centerTitle: true,
      toolbarHeight: toolbarHeight,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        (toolbarHeight ?? kToolbarHeight) + (bottom?.preferredSize.height ?? 0),
      );
}
