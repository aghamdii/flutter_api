import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/core/shared/styles/app_colors.dart';
import 'package:flutter_api/core/shared/utils/routes.dart';
import 'package:flutter_api/features/posts/bloc/posts_bloc.dart';
import 'package:flutter_api/features/posts/data/repository/posts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar', ''),
        Locale('en', ''),
      ],
      path: 'assets/lang',
      fallbackLocale: const Locale('ar', ''),
      child: BlocProvider<PostsBloc>(
        create: (context) => PostsBloc(
          PostsRepository(),
        ),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of yeour application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
      ),
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
