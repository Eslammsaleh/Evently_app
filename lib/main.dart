import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/core/Theme/app_theme.dart';
import 'package:flutter_application_1/core/app_routes/routes.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/modeules/splash/screens/layout/home/HomeView.dart';

import 'package:flutter_application_1/modules/authorization/login_page.dart';
import 'package:flutter_application_1/modules/onbording/onbording_screen.dart';



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Providers
final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);
final languageProvider = StateProvider<String>((ref) => "en");

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();

  // ✅ شوف إذا شاف الـ Onboarding قبل كده
  final seenOnboarding = prefs.getBool("onboarding_seen") ?? false;

  // ✅ الثيم (Dark/Light) محفوظ
  final isDark = prefs.getBool("isDark") ?? false;

  // ✅ اللغة محفوظة
  final savedLang = prefs.getString("language") ?? "en";

  // ✅ اليوزر لو مسجل دخول
  final user = FirebaseAuth.instance.currentUser;

  runApp(
    ProviderScope(
      overrides: [
        themeProvider.overrideWith((ref) => isDark ? ThemeMode.dark : ThemeMode.light),
        languageProvider.overrideWith((ref) => savedLang),
      ],
      child: MyApp(
        startRoute: seenOnboarding
            ? (user != null ? HomeView.route : LoginPage.route)
            : OnboardingScreen.route,
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  final String startRoute;

  const MyApp({super.key, required this.startRoute});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = ref.watch(themeProvider);
    var local = ref.watch(languageProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Evently",
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(local),
      supportedLocales: const [Locale('en'), Locale('ar')],
      routes: AppRoutes.routes,
      initialRoute: startRoute,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: theme,
    );
  }
}
