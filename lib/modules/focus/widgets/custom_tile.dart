import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final String description;
  final String? iconPath;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomTile(
      {super.key,
      required this.title,
      required this.description,
      this.iconPath,
      this.onTap,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    print("iconPath: $iconPath");
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: backgroundColor ?? Theme.of(context).colorScheme.surface,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              // color: Theme.of(context).colorScheme.primary,
            ),
            height: 50,
            width: 50,
            child: SvgPicture.asset(iconPath!, height: 30, width: 30,),
          ),

          const SizedBox(
            width: 15,
          ),

          // title & description
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    color:
                        textColor ?? Theme.of(context).colorScheme.onSurface),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                description,
                style: TextStyle(
                    fontSize: 13,
                    color:
                        textColor ?? Theme.of(context).colorScheme.onSurface),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),

          const SizedBox(width: 15),

          Container(
            width: 0.5,
            height: 50,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),

          const SizedBox(width: 15),

          Icon(
            Icons.info_outline,
            size: 30,
          ),
        ]),
      ),
    );
  }
}
