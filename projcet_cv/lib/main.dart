import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projcet_cv/All%20User%20CV/bloc/all_cv_bloc.dart';
import 'package:projcet_cv/data/data_layer.dart';
import 'package:projcet_cv/views/CV%20Space/bloc/c_vv_bloc.dart';
import 'package:projcet_cv/views/Edit%20CV/bloc/cv_bloc.dart';
import 'package:projcet_cv/views/Login/bloc/authentication_bloc.dart';
import 'package:projcet_cv/views/Login/login_view.dart';
import 'package:projcet_cv/service/configration_database.dart';
import 'package:projcet_cv/views/SingUp/bloc/sign_up_bloc.dart';
import 'package:projcet_cv/widgets/bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseConfig();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<HomeData>();
    locator.getToken();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider(create: (context) => CvBloc()),
        BlocProvider(
          create: (context) => CVvBloc()..add(DisplayCVEvent()),
        ),
         BlocProvider(
          create: (context) => AllCvBloc()..add(DisplayAllCVEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: locator.token.isNotEmpty ? BottomNavBarr() : LoginView(),
      ),
    );
  }
}
