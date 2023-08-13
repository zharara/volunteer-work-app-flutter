import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'bloc_registrant.dart';
import 'firebase_options.dart';
import 'initialization.dart';
import 'ui/pages/common_pages/login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'ui/pages/management/main/management_main_page.dart';
import 'ui/pages/organization/main/organization_main_page.dart';
import 'ui/pages/student/main/student_main_page.dart';
import 'utils/types.dart';

import 'utils/app_storage.dart';
import 'utils/styling.dart';

late AppStorage globalAppStorage;
final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  globalAppStorage = await AppStorage.getInstance();

  await Initialization.initFirebaseMessaging();

  runApp(const VolunteerWorkApp());

  // splash
  await Future.delayed(const Duration(seconds: 1));

  FlutterNativeSplash.remove();
}

class VolunteerWorkApp extends StatelessWidget {
  const VolunteerWorkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocRegistrant(
      child: MaterialApp(
        navigatorKey: appNavigatorKey,
        supportedLocales: const [Locale('ar')],
        locale: const Locale('ar'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        title: 'VolunteerWorkApp',
        theme: lightThemeData,
        home: determineHome(),
      ),
    );
  }
}

Widget determineHome() {
  switch (globalAppStorage.getAccountType()) {
    case AccountType.management:
      final management = globalAppStorage.getManagementAccount();
      if (management != null) {
        return ManagementMainPage(
          managementEmployeeDto: management,
        );
      }
      break;
    case AccountType.organization:
      final organization = globalAppStorage.getOrganizationAccount();
      if (organization != null) {
        return OrganizationMainPage(
          organizationDto: organization,
        );
      }
      break;
    case AccountType.student:
      final student = globalAppStorage.getStudentAccount();
      if (student != null) {
        return StudentMainPage(
          studentDto: student,
        );
      }
      break;
    default:
      break;
  }

  return const LoginPage();
}
