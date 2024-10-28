import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FunctionCard extends StatelessWidget {
  final String title;
  final int sessions;
  final String iconPath;
  final String? backgroundImagePath; // 新增背景图参数
  final Color backgroundColor;
  final double height;
  final VoidCallback? onTap;

  const FunctionCard({
    super.key,
    required this.title,
    required this.sessions,
    required this.iconPath,
    this.backgroundImagePath, // 可选参数
    required this.backgroundColor,
    required this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            // 背景图层
            if (backgroundImagePath != null)
              Positioned.fill(
                child: Center(
                  child: SvgPicture.asset(
                    backgroundImagePath!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            // 内容图层
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    iconPath,
                    width: 32,
                    height: 32,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$sessions sessions',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
