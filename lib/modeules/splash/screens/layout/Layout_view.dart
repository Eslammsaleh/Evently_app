// ================= LayoutView =================
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Theme/app_colors.dart';
import 'package:flutter_application_1/core/constatnts/app_assets.dart';
import 'package:flutter_application_1/modeules/splash/screens/layout/favorite/favorite_view.dart';
import 'package:flutter_application_1/modeules/splash/screens/layout/home/HomeView.dart';
import 'package:flutter_application_1/modeules/splash/screens/layout/maps/MapsView.dart';
import 'package:flutter_application_1/modeules/splash/screens/layout/profile/profile_view.dart';

class LayoutView extends StatefulWidget {
  static const String route = 'navigationlayout';
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _NavigationLayoutScreenState();
}

class _NavigationLayoutScreenState extends State<LayoutView> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeView(),
    MapsView(),
    FavoriteView(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {}, // زر + فاضي
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 26,
            backgroundColor: AppColors.primaryColor,
            child: const Icon(Icons.add, color: Colors.white, size: 30),
          ),
        ),
      ),
      body: screens[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.homeIcn)),
            activeIcon: ImageIcon(AssetImage(AppAssets.homeActiveIcn)),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.mapsIcn)),
            activeIcon: ImageIcon(AssetImage(AppAssets.mapsActiveIcn)),
            label: "Maps",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.favoriteIcn)),
            activeIcon: ImageIcon(AssetImage(AppAssets.favoriteActiveIcn)),
            label: "Love",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.userIcn)),
            activeIcon: ImageIcon(AssetImage(AppAssets.userActiveIcn)),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
