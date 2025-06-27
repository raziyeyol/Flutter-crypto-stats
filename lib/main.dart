import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'helpers/initialize_dependency.dart';
import '/service/repository.dart';
import '/ui/library.dart';
import '/cubit/crypto_asset_cubit.dart';
import '/cubit/live_prices_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies(mock: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0xFFF6F8FB),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 2,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            iconTheme: IconThemeData(color: Colors.blueAccent),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Crypto Stats'),
          ),
          body: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) =>
                    CryptoAssetCubit(getIt<IRepository>()),
              ),
              BlocProvider(
                  create: (BuildContext context) => getIt<LivePricesCubit>())
            ],
            child: const HomeScreen(),
          ),
        ));
  }
}
