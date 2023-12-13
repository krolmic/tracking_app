import 'package:flutter/material.dart';
import 'package:tracking_app/shared/theme/colors.dart';

class Tile extends StatelessWidget {
  const Tile({
    required this.leading,
    required this.title,
    required this.onTap,
    this.subTitle,
    this.isLoading = false,
    super.key,
  });

  final Widget leading;
  final String title;
  final VoidCallback onTap;
  final String? subTitle;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: tileShadowColor,
      child: ListTile(
        iconColor: tileIconColor,
        leading: leading,
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: tileTitleColor,
          ),
        ),
        titleAlignment: ListTileTitleAlignment.threeLine,
        subtitle: subTitle != null
            ? Text(
                subTitle!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: tileSubtitleColor,
                ),
              )
            : null,
        trailing: isLoading
            ? SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(
                  color: primarySwatch.shade200,
                ),
              )
            : const Icon(
                Icons.chevron_right,
              ),
        onTap: isLoading ? null : onTap,
      ),
    );
  }
}
