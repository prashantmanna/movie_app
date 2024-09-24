import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MovieAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MovieAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.toolbarHeight = 80.0,
    this.color = Colors.white,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final Color? color;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final double? toolbarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Iconsax.arrow_left),
      )
          : leadingIcon != null
          ? IconButton(
        onPressed: leadingOnPressed,
        icon: Icon(leadingIcon),
      )
          : null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
