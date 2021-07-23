import 'package:flutter/material.dart';
import 'package:flutter_getx_study/global_repository.dart';
import 'package:flutter_getx_study/theme_repository.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GlobalRepository.setPrefs();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> with WidgetsBindingObserver {
  final themeRepository = ThemeRepository();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (themeRepository.themeMode == ThemeMode.system) {
      final isDarkMode = WidgetsBinding.instance!.window.platformBrightness == Brightness.dark;

      if (isDarkMode) {
        Get.changeThemeMode(ThemeMode.dark);
      } else {
        Get.changeThemeMode(ThemeMode.light);
      }
    }

    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        backgroundColor: Colors.white,
      ),
      darkTheme: ThemeData.dark().copyWith(
        backgroundColor: Colors.black,
      ),
      themeMode: themeRepository.themeMode,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text('change to light'),
              onPressed: () {
                ThemeRepository().changeThemeMode(ThemeMode.light);
              },
            ),
            TextButton(
              child: Text('change to dark'),
              onPressed: () {
                ThemeRepository().changeThemeMode(ThemeMode.dark);
              },
            ),
            TextButton(
              child: Text('change to system'),
              onPressed: () {
                ThemeRepository().changeThemeMode(ThemeMode.system);
              },
            ),
          ],
        ),
      ),
    );
  }
}
