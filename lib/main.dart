import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(const HeroPartner());
}

class HeroPartner extends StatefulWidget {
  const HeroPartner({
    Key? key,
  }) : super(key: key);

  @override
  State<HeroPartner> createState() => _HeroPartnerState();
}

class _HeroPartnerState extends State<HeroPartner> {
  final _appStateManager = AppStateManager();
  final _createAccountManager = LoginStateManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
        appStateManager: _appStateManager,
        loginStateManager: _createAccountManager
        // groceryManager: _groceryManager,
        // profileManager: _profileManager,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _appStateManager),
        ChangeNotifierProvider(create: (context) => _createAccountManager)
      ],
      child: MaterialApp(
        title: 'Hero Partner',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSwatch(
        //       accentColor: kPrimaryColor,
        //       primarySwatch: Colors.green,
        //       cardColor: kPrimaryColor),
        // ),
        home: Router(
          routerDelegate: _appRouter,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
