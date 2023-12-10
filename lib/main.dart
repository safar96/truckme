import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckme/page/auth/login_p.dart';
import 'package:truckme/page/auth/registration_p.dart';
import 'package:truckme/page/auth/sms_confirm_p.dart';
import 'package:truckme/page/auth/splash_p.dart';
import 'package:truckme/page/main/main_new.dart';
import 'package:truckme/provider/auth_provider.dart';
import 'package:truckme/provider/request_provider.dart';
import 'core/app_data/global_class.dart';
import 'core/database/init_database.dart';
import 'core/database/user_session_table.dart';
import 'core/language/language_selection.dart';
import 'model/user/user_info.dart';
import 'model/user/user_session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Global.isFirst = true;

  Locale locale = await getLocal();
  runApp(
    ChangeNotifierProvider<AuthProvider>(
      create: (BuildContext context) => AuthProvider(),
      child: EasyLocalization(
        supportedLocales: const [
          Locale('uz', 'UZB'),
          Locale('ru', 'RU'),
          Locale('en', 'EN'),
        ],
        fallbackLocale: const Locale('uz', 'UZB'),
        startLocale: locale,
        path: 'assets/translations',
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = false;
  bool _isFirstLogin = true;

  Future<void> _checkLoginInfo() async {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    InitDatabase initDatabase = InitDatabase();
    UserSessionTable userSessionTable = UserSessionTable();
    int len = 0;
    await initDatabase.initializedDB().whenComplete(() async {
      len = await userSessionTable.countUserSession();
    });
    if (len != 0) {
      UserSession userSession = await userSessionTable.retrieveUserSession();
      Global.myUserInfo = UserInfo.fromJson(
        {},
        userSession.token,
        userSession.refresh_token,
      );
      final checkToken = await provider.checkToken();
      if (checkToken) {
        _isFirstLogin = false;
      } else {
        await initDatabase.initializedDB().whenComplete(() async {
          await userSessionTable.deleteUserSession();
        });
        _isFirstLogin = true;
      }
    } else {
      _isFirstLogin = true;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    _checkLoginInfo().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: RequestProvider(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'TruckMe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _isFirstLogin
                ? const SplashP()
                : const MainNew(),
        routes: {
          "/login": (BuildContext context) => const LoginP(),
          "/registration": (BuildContext context) => const RegistrationP(),
          "/sms": (BuildContext context) => const SmsConfirmP(),
          "/main-page": (BuildContext context) => const MainNew(),
        },
      ),
    );
  }
}

//flutter build apk --split-per-abi
