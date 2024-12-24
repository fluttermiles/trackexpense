import 'package:flutter/services.dart';
import 'package:trackexpense/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
    )
  );
  // await Firebase.initializeApp();
  runApp(
    // MultiBlocProvider(
    //   providers: [
        // BlocProvider(
        //   create: (context) => AddproductBloc(productRepository: ProductRepositoryImpl()),
        // ),
      // ],
      // child: 
      const MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          );
        }
      )
    );
  }
}