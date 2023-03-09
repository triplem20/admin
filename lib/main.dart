import 'dart:js_util';


import 'package:admin/screens/dashboard/dash_screen.dart';
import 'package:admin/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:admin/screens/menu_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'blocs/blocs.dart';
import 'blocs/settings/settings_bloc.dart';
import 'models/models.dart';
import 'models/request_model.dart';
import 'screens/requests/requests.dart';
import 'screens/settings/settings_screen.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc()
            ..add(
              LoadCategories(categories: Category.categories),
            ),
        ),
        BlocProvider(
          create: (context) => FilterBloc()
            ..add(
              LoadFilters(filters: Filter.filters),
            ),
        ),
        BlocProvider(
          create: (context) => RequestBloc(
              filterBloc: BlocProvider.of<FilterBloc>(context)
          )..add(
            LoadRequests(requests: Request.requests),
          ),
        ),
        BlocProvider(
          create: (context) => ServiceBloc(
            categoryBloc: BlocProvider.of<CategoryBloc>(context),
          )..add (
            LoadServices(services: Service.services),
          ),
        ),
        BlocProvider(
          create: (context) => ProductBloc(
            categoryBloc: BlocProvider.of<CategoryBloc>(context),
          )..add (
            LoadProducts(products: Product.products),
          ),
        ),
        BlocProvider(
          create: (context) => SettingsBloc()
            ..add(
              LoadSettings(
                restaurant:
                Restaurant(openingHours: OpeningHours.openingHoursList),
              ),
            ),
        ),
      ],


      child:GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Top Care Admin',
        theme: ThemeData(
          primaryColor: Colors.greenAccent,
        ),
        home: LoginScreen(),
        routes: {
          '/menu': (context) => const MenuScreen(),
          '/settings': (context) => const SettingsScreen(),
          '/dashboard': (context) => const DashScreen(),
          '/requests': (context) => const RequestsScreen(),
          '/login': (context) => const LoginScreen(),

        },
      ),
    );
  }
}

