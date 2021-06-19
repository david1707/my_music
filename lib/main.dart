import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import './provider/user.dart';
import './screens/album_create.dart';
import './screens/album_edit.dart';
import './screens/album_list.dart';
import './screens/band_create.dart';
import './screens/band_edit.dart';
import './screens/band_list.dart';
import './screens/genre_list.dart';
import './screens/login_screen.dart';
import './screens/main_screen.dart';
import './screens/sign_up_screen.dart';
import './screens/splash_screen.dart';
import './screens/user_collection.dart';
import './screens/user_info.dart';
import './screens/user_lists.dart';
import './screens/user_view_list.dart';
import './screens/user_whislist.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Music',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginScreen.routeName,
      routes: {
        AlbumCreateScreen.routeName: (context) => AlbumCreateScreen(),
        AlbumEditScreen.routeName: (context) => AlbumEditScreen(),
        AlbumListScreen.routeName: (context) => AlbumListScreen(),
        BandCreateScreen.routeName: (context) => BandCreateScreen(),
        BandEditScreen.routeName: (context) => BandEditScreen(),
        BandListScreen.routeName: (context) => BandListScreen(),
        GenreListScreen.routeName: (context) => GenreListScreen(),
        LoginScreen.routeName: (context) {
          if (FirebaseAuth.instance?.currentUser?.email != null)
            return MainScreen();
          else
            return LoginScreen();
        },
        MainScreen.routeName: (context) => MainScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        UserCollectionScreen.routeName: (context) => UserCollectionScreen(),
        UserInfoScreen.routeName: (context) => UserInfoScreen(),
        UserListsScreen.routeName: (context) => UserListsScreen(),
        UserViewListcreen.routeName: (context) => UserViewListcreen(),
        UserWishListScreen.routeName: (context) => UserWishListScreen(),
      },
    );
  }
}
