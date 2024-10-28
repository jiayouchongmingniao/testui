import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/navigation_provider.dart';
import 'pages/home_page.dart';
import 'pages/explore_page.dart';
import 'pages/sleep_page.dart';
import 'pages/profile_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: MaterialApp(
        title: 'Meditation App',
        theme: ThemeData(
          primaryColor: const Color(0xFF6750A4),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return Scaffold(
          body: IndexedStack(
            index: navigationProvider.currentIndex,
            children: const [
              HomePage(),
              ExplorePage(),
              SleepPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationProvider.currentIndex,
            onTap: (index) => navigationProvider.setIndex(index),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF6750A4),
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/tabs/home.svg',
                  color: Colors.grey,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/tabs/home.svg',
                  color: const Color(0xFF6750A4),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/tabs/explore.svg',
                  color: Colors.grey,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/tabs/explore.svg',
                  color: const Color(0xFF6750A4),
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/tabs/sleep.svg',
                  color: Colors.grey,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/tabs/sleep.svg',
                  color: const Color(0xFF6750A4),
                ),
                label: 'Sleep',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/tabs/user.svg',
                  color: Colors.grey,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/tabs/user.svg',
                  color: const Color(0xFF6750A4),
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
