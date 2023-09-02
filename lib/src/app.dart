import 'package:flutter/material.dart';
import 'package:movies/src/src.dart';
import 'package:provider/provider.dart';

class AppState extends StatelessWidget {
  final Widget child;
  const AppState({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieProvider>(
          create: (_) => MovieProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<CastProvider>(
          create: (_) => CastProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<VideoProvider>(
          create: (_) => VideoProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<AppProvider>(
          create: (_) => AppProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<ShowProvider>(
          create: (_) => ShowProvider(),
          lazy: false,
        ),
      ],
      child: child,
    );
  }
}