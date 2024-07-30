import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pixel_app/bloc/address_bloc/bloc/address_bloc.dart';
import 'package:pixel_app/bloc/autofile_bloc/bloc/auto_fill_bloc.dart';
import 'package:pixel_app/bloc/user_bloc/validation_bloc.dart';
import 'package:pixel_app/data/model/data_model.dart';
import 'package:pixel_app/view/screens/pan_card_adding.dart';
import 'package:pixel_app/view/utils/constants/navigations.dart';

import 'bloc/user_bloc/user_bloc.dart';
import 'data/model/address_model.dart';
import 'data/repositery/data_funtions.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(PanDatasAdapter());
  Hive.registerAdapter(AddressTableAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ValidationBloc(),
        ),
        BlocProvider(create: (context) => AddressBloc()),
        BlocProvider(create: (context) => AutoFillBloc()),
        BlocProvider(create: (context) => UserBloc(HiveService())),
      ],
      // Initialize your Bloc here
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PanCardAddingScreen(),
      ),
    );
  }
}
