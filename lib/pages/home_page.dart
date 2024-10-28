import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/function_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Stack(
          children: [
            SvgPicture.asset(
              'assets/header/Rectangle.svg',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/header/opeation.svg',
                      width: 24,
                      height: 24,
                    ),
                    const Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 24), // 为了保持标题居中
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good Morning!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'What would you like to focus on?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: const [
                  FunctionCard(
                    title: 'Happiness',
                    sessions: 16,
                    iconPath: 'assets/images/face_icon.svg',
                    backgroundImagePath: 'assets/images/face.svg',
                    backgroundColor: Color(0xFFEF476F),
                    height: 235,
                  ),
                  FunctionCard(
                    title: 'Goodnight',
                    sessions: 22,
                    iconPath: 'assets/images/moon_icon.svg',
                    backgroundImagePath: 'assets/images/moon.svg',
                    backgroundColor: Color(0xFFFFB4A2),
                    height: 273,
                  ),
                  FunctionCard(
                    title: 'Focus',
                    sessions: 34,
                    iconPath: 'assets/images/focus_icon.svg',
                    backgroundImagePath: 'assets/images/focus.svg',
                    backgroundColor: Color(0xFFE07A5F),
                    height: 273,
                  ),
                  FunctionCard(
                    title: 'Energy',
                    sessions: 18,
                    iconPath: 'assets/images/music_icon.svg',
                    backgroundImagePath: 'assets/images/music.svg',
                    backgroundColor: Color(0xFF3D405B),
                    height: 235,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
