import 'package:flutter/material.dart';
import 'package:mvvm_sample/utils/routes/routes.dart';
import 'package:mvvm_sample/utils/routes/routes_name.dart';
import 'package:mvvm_sample/view/home_screen.dart';
import 'package:mvvm_sample/view/login_view.dart';
import 'package:mvvm_sample/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      ChangeNotifierProvider(create: (_)=> AuthViewModel())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     initialRoute: RoutesName.login,
     onGenerateRoute: Routes.generateRoute,
    ),
     );
  }
}
