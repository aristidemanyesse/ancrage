import 'package:ancrage/core/apiservice.dart';
import 'package:flutter/material.dart';

class ImageActivity extends StatelessWidget {
  const ImageActivity({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Image.network(
          ApiService.MEDIA_URL + path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
