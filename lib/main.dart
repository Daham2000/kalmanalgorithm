import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalmanalgorithm/screens/home_bloc.dart';
import 'screens/home_page.dart';
import 'screens/home_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final materialApp = MaterialApp(
      title: 'Kalman algorithm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeProvider(),
    );

    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<HomeBloc>(create: (context) => HomeBloc(context)),
      ],
      child: materialApp,
    );
  }
}
