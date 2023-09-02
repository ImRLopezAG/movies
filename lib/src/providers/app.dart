import 'package:flutter/material.dart';
import 'package:movies/src/src.dart';

class AppProvider extends ChangeNotifier {
  ThemeData _theme = AppTheme.darkTheme;
  int _currentPage = 0;

  int get currentPage => _currentPage;

  ThemeData get theme => _theme;

  set currentPage(int page) {
    print(page);
    _currentPage = page;
    notifyListeners();
  }

  void changeTheme() {
    _theme = _theme == AppTheme.lightTheme
        ? AppTheme.darkTheme
        : AppTheme.lightTheme;
    notifyListeners();
  }
}
