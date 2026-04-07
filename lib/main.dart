import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'screens/splash_screen.dart';

final themeProvider = ThemeProvider();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const A7gezlyApp());
}

class A7gezlyApp extends StatefulWidget {
  const A7gezlyApp({super.key});

  @override
  State<A7gezlyApp> createState() => _A7gezlyAppState();
}

class _A7gezlyAppState extends State<A7gezlyApp> {
  @override
  void initState() {
    super.initState();
    themeProvider.addListener(() {
      AppColors.setDark(themeProvider.isDark);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A7gezly',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: const SplashScreen(),
    );
  }
}
