import 'package:flutter/material.dart';
import 'package:online_uyvazifa4/string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentIndex = page;
              });
            },
            children: [
              makePage(
                  image: 'assets/images/image1.jpeg',
                  title: Strings.stepOnetitle,
                  content: Strings.stepOneContent),
              makePage(
                  image: 'assets/images/imahe3.jpeg',
                  title: Strings.stepTwotitle,
                  content: Strings.stepTwoContent),
              makePage(
                  image: 'assets/images/image2.jpeg',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepTwoContent),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          _skib(_currentIndex)
        ],
      ),
    );
  }

  Widget _skib(int c) {
    if (_currentIndex == 2) {
      return GestureDetector(
        child: Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 60),
          child: const Text(
            'Skib',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      );
    }
    return Container();
  }

  Widget makePage({image, title, content}) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 50, bottom: 50, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  content,
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(image),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (var i = 0; i < 3; i++) {
      if (_currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
