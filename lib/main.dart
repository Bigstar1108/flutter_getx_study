import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:repository/repository.dart';
import 'package:localization/localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GlobalRepository.setPrefs();

  runApp(
    StakatakaThemeWidget(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
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
      themeMode: ThemeService().themeMode,
      home: MyHomePage(),
      translations: LocalizationService(),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.defaultLocale,
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
                ThemeService().changeThemeMode(ThemeMode.light);
              },
            ),
            TextButton(
              child: Text('change to dark'),
              onPressed: () {
                ThemeService().changeThemeMode(ThemeMode.dark);
              },
            ),
            TextButton(
              child: Text('change to system'),
              onPressed: () {
                ThemeService().changeThemeMode(ThemeMode.system);
              },
            ),
            Text('test'.tr),
            ...LocalizationService.langs
                .map(
                  (e) => TextButton(
                    onPressed: () {
                      LocalizationService.changeLocale(e);
                    },
                    child: Text(
                      e,
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
