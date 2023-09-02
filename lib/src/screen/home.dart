import 'package:flutter/material.dart';
import 'package:movies/src/src.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    final List<Widget> screens = [
      const HomeWidget(),
      const GendersScreen(),
      const ShowWidget(),
    ];
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(appProvider.theme == AppTheme.lightTheme
                ? Icons.dark_mode_rounded
                : Icons.light_mode_rounded),
            onPressed: () {
              appProvider.changeTheme();
            },
          ),
          title: const Text('Movies'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () => showSearch(
                context: context,
                delegate: MovieSearchDelegate(),
              ),
            )
          ],
        ),
        body: screens[appProvider.currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: appProvider.currentPage,
          onTap: (int index) {
            appProvider.currentPage = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter_rounded),
              label: 'Gender',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv_rounded),
              label: 'Shows',
            ),
          ],
        ));
  }
}
