import 'package:flutter/material.dart';
import 'package:productos_app/providers/ui_provider.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/push_notifications_services.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

void main() async {

  //WidgetsFlutterBinding.ensureInitialized:
  //  Asegurarse de tener por lo menos un context 
  //  antes de obtener el token
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();

  runApp(MyApp());

}

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => ProductsService() ),
        ChangeNotifierProvider( create: (_) => AuthService() ),
        ChangeNotifierProvider(create: (_) => UiProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState(){

    super.initState();
    PushNotificationService.messageStream.listen((message) { 
      
      print(message);

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products App',
      initialRoute: 'login',
      navigatorKey: navigatorKey,
      //scaffoldMessengerKey: messengerKey,
      routes: {
        'login': (_) => const LoginScreen(),
        'register': (_) => const RegisterScreen(),
        'home': (_) => const HomeScreen(),
        'product': (_) => const ProductScreen(),
        'checking': (_) => CheckAuthScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.indigo
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 5
        )
      ),
    );
  }
}