import 'package:flutter/material.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    this.showBackArrow = false,
    this.centerTitle = false,
    this.backgroundColor = Colors.transparent,
    required this.onPressed,
    this.elevation = 0.5,
  });

  final Widget? title;
  final List<Widget>? actions;
  final bool showBackArrow, centerTitle;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: backgroundColor,
        elevation: elevation,
        centerTitle: centerTitle,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.arrow_back_ios_new_outlined,
                    color: Colors.black))
            : null,
        title: title,
        actions: actions);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
