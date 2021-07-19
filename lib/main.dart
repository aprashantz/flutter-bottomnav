import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Buttom Navigation",
      home: MainPage(),
    ));

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Widget> myWidget = <Widget>[
    bottomNavFrame("Home Page", Colors.blue),
    bottomNavFrame("Scan Page", Colors.red),
    bottomNavFrame("Profile Page", Colors.purple),
  ];

  _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Response Analyzer"),
        centerTitle: true,
        backgroundColor: Colors.blue, //Color()xFFFF0000)
      ),
      body: Center(
        child: myWidget.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Analyse"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}

class bottomNavFrame extends StatelessWidget {
  final String title;
  final Color bodyColor;

  bottomNavFrame(this.title, this.bodyColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 200,
        width: double.infinity,
        color: bodyColor,
        child: Center(
          child: Text(
            "Welcome to $title",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
