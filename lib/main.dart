// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:event_hunter/models/user_model.dart';
import 'package:event_hunter/providers/auth_provider.dart';
import 'package:event_hunter/providers/checkout_provider.dart';
import 'package:event_hunter/providers/ticket_provider.dart';
import 'package:event_hunter/providers/event_provider.dart';
import 'package:event_hunter/providers/page_provider.dart';
import 'package:event_hunter/ui/pages/change_password_page.dart';
import 'package:event_hunter/ui/pages/daftar_tiket.dart';
import 'package:event_hunter/ui/pages/detail_tiket_page.dart';
import 'package:event_hunter/ui/pages/daftar_tiket_available_page.dart';
import 'package:event_hunter/ui/pages/edit_profile_page.dart';
import 'package:event_hunter/ui/pages/explore_event_page.dart';
import 'package:event_hunter/ui/pages/home/main_page.dart';
import 'package:event_hunter/ui/pages/home/profile_page.dart';
import 'package:event_hunter/ui/pages/sign_in_page.dart';
import 'package:event_hunter/ui/pages/sign_up_page.dart';
import 'package:event_hunter/ui/pages/splash_screen.dart';
import 'package:event_hunter/ui/pages/welcome_page.dart';
import 'package:event_hunter/ui/test_api_pages/register_response_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var user = prefs.getString('userSaved');
  // var userNow;
  // if (user != null) {
  //   var getUser = UserModel.fromJson(json.decode(user));
  //   userNow = getUser;
  // }

  runApp(MyApp(
      // initialRoute: user == null ? '/sign-in' : '/home',

      // note : untuk tampilkan halaman sesuai ROLE
      // initialRoute: user == null ? '/' : '/home'

      // note : untuk cek apakah user sudah login atau belum
      // initialRoute: user == null ? '/sign-in' : '/welcome-page',
      ));
}

class MyApp extends StatelessWidget {
  // final String initialRoute;
  const MyApp({
    // required this.initialRoute,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EventProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TicketProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckoutProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        // initialRoute: initialRoute,
        routes: {
          '/': (context) => SplashPage(),
          '/welcome-page': (context) => WelcomePage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/explore-location': (context) => ExploreEventPage(),
          // '/daftar-tiket-available': (context) => DaftarTiketAvailablePage(),
          '/daftar-tiket-available': (context) => DaftarTiket(),
          '/detail-tiket-page': (context) => DetailTiketPage(),
          '/profile-page': (context) => ProfilePage(),
          '/edit-profile-page': (context) => EditProfilePage(),
          '/change-password-page': (context) => ChangePasswordPage()
          // note : TEST API PAGE
          // '/register-response-page': (context) => RegisterResponsePage(),
        },
      ),
    );
  }
}
