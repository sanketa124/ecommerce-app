import 'package:amazon_clone/layout/screen_layout.dart';
import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/screens/cart_scree.dart';
import 'package:amazon_clone/screens/home_screen.dart';
import 'package:amazon_clone/screens/product_screen.dart';
import 'package:amazon_clone/screens/results_screen.dart';
import 'package:amazon_clone/screens/sign_in_screen.dart';
import 'package:amazon_clone/screens/sign_up_screen.dart';
import 'package:amazon_clone/splash-screens/sp_1.dart';
import 'package:amazon_clone/splash-screens/sp_2.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDhstYZztuZwtgg19BWH52ixyV_VH3EHng",
            authDomain: "amazin-site.firebaseapp.com",
            projectId: "amazin-site",
            storageBucket: "amazin-site.appspot.com",
            messagingSenderId: "413106010700",
            appId: "1:413106010700:web:471f87d1b161c7dcbad2e9",
            measurementId: "G-PJE5RZSYGL"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserDetailsProvider())],
      child: MaterialApp(
        title: "Amazon Clone",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<User?> user) {
              if (user.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              } else if (user.hasData) {
                return const
                    //SplashScreen1();
                    ScreenLayout();
                //return const SellScreen();
              } else {
                return const
                    //SplashScreen2();
                    SignInScreen();
              }
            }),
      ),
    );
  }
}
