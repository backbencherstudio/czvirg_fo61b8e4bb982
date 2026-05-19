import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/resource/theme_manager.dart';
import 'core/route/route_import_part.dart';
import 'core/route/route_name.dart';
import 'l10n/app_localizations.dart';
import 'presentation/provider/language_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCode = ref.watch(languageProvider);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'CLARAVIDA',
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('bn')],
        locale: Locale(languageCode),
        onGenerateRoute: AppRouter.getRoute,
        initialRoute: RouteName.splashRoute,
      ),
    );
  }
}
