import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Theme/app_colors.dart';
import 'package:flutter_application_1/modules/authorization/login_page.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_application_1/main.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  static const String route = '/onboarding';

  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("onboarding_seen", true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  final List<Map<String, String>> _pages = [
    {
      "title": "Connect with Friends & Share Moments",
      "desc": "Make every event memorable by sharing the experience with others...",
      "image": "assets/image/Intro1.png",
    },
    {
      "title": "Find Events That Inspire You",
      "desc": "Dive into a world of events crafted to fit your unique interests...",
      "image": "assets/image/hot-trending.png",
    },
    {
      "title": "Effortless Event Planning",
      "desc": "Take the hassle out of organizing events with our all-in-one planning tools...",
      "image": "assets/image/being-creative.png",
    },
    {
      "title": "Connect with Friends & Share Moments",
      "desc": "Make every event memorable by sharing the experience with others...",
      "image": "assets/image/being-creative (1).png",
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var local = AppLocalizations.of(context)!;
    var themeMode = ref.watch(themeProvider);
    var localProv = ref.watch(languageProvider);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Logo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Image.asset("assets/logo/headerLogo.png", height: 60),
              ),
            ),

            // PageView
            Expanded(
              flex: 6,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Expanded(
          child: Image.asset(
            _pages[index]["image"]!,
            width: 250,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          _pages[index]["title"]!,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          _pages[index]["desc"]!,
          style: theme.textTheme.bodyMedium?.copyWith(
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),

        // ✅ لو الصفحة الأولى (Intro1.png) هعرض الـ toggles
        if (_pages[index]["image"] == "assets/image/Intro1.png") ...[
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Language",
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    AnimatedToggleSwitch<String>.rolling(
                      textDirection: TextDirection.ltr,
                      current: localProv,
                      values: ["ar", "en"],
                      iconList: [
                        Image.asset("assets/Icons/EG (2).png"),
                        Image.asset("assets/Icons/LR (5).png"),
                      ],
                      indicatorSize: const Size(40, 40),
                      height: 40,
                      style: ToggleStyle(
                        backgroundColor: Colors.transparent,
                        borderColor: AppColors.primaryColor,
                        indicatorColor: AppColors.primaryColor,
                      ),
                      onChanged: (String i) {
                        ref.read(languageProvider.notifier).state = i;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      "Theme",
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    AnimatedToggleSwitch<ThemeMode>.rolling(
                      current: themeMode,
                      values: [ThemeMode.light, ThemeMode.dark],
                      iconList: [
                        Image.asset("assets/Icons/Light.png"),
                        Image.asset(
                          "assets/Icons/Dark.png",
                          color: themeMode == ThemeMode.dark
                              ? Colors.white
                              : null,
                        ),
                      ],
                      indicatorSize: const Size(40, 40),
                      height: 40,
                      style: ToggleStyle(
                        backgroundColor: Colors.transparent,
                        borderColor: AppColors.primaryColor,
                        indicatorColor: AppColors.primaryColor,
                      ),
                      onChanged: (value) {
                        ref.read(themeProvider.notifier).state = value;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ],
    ),
  );
},

              ),
            ),

            // Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? AppColors.primaryColor
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),

            // Toggles (Language + Theme)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                 
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Buttons (Skip / Next)
            // Buttons (Skip / Next OR Let's Start in first page)
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  child: _currentPage == 0
      ? SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              // لما يدوس Let's Start يروح للصفحة التانية
              _pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
            child: const Text(
              "Let’s Start",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (_currentPage > 0) {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Image.asset("assets/Icons/arrowLeft.png", width: 50),
            ),
            GestureDetector(
              onTap: () {
                if (_currentPage == _pages.length - 1) {
                  _completeOnboarding(context);
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Image.asset("assets/Icons/arrowright.png", width: 50),
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
