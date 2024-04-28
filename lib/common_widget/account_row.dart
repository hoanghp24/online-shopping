import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class AccountRow extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;

  const AccountRow(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: [
                Image.asset(
                  icon,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Icon(Iconsax.arrow_right_3)
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.black26,
          height: 1,
        ),
      ],
    );
  }
}
