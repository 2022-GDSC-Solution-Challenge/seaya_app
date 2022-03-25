import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seaya_app/providers/UserProvider.dart';
import 'package:seaya_app/screens/competepage/Competition.dart';
import 'package:seaya_app/screens/qandmpage/Q&M.dart';
import 'package:seaya_app/screens/mainhomepage/Home.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  late UserProvider _userProvider;

  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    QuizMission(),
    Competition(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      _userProvider.fetchData();
    }
  }
  //widget 체크 포인트 -> home icon , q&m icon 변경여부

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget get bottomNavigationBar {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(52, 87, 134, 160),
                spreadRadius: 0,
                blurRadius: 18),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTap,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(
              fontFamily: 'PTSansRegular',
              fontSize: 11,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'PTSansRegular',
              fontSize: 10,
            ),
            selectedItemColor: const Color.fromARGB(255, 76, 112, 160),
            unselectedItemColor: const Color.fromARGB(255, 193, 205, 224),
            showUnselectedLabels: true,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 22,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_books,
                  size: 22,
                ),
                label: 'Q&M',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.group_rounded,
                  size: 22,
                ),
                label: 'Competition',
              ),
            ],
          ),
        ));
  }
}
