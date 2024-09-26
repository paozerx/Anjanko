import 'package:flutter/material.dart';
import 'practice.dart';

class Select extends StatelessWidget {
  const Select({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 104, 84, 84),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  const Text(
                    "Select Mode",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: 'MyCustomFont',
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 10,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Practice(data: 'Food'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              screenSize.width * 0.4, screenSize.width * 0.4),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 161, 21),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/food.png'),
                              width: 60,
                              height: 60,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Food',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'MyCustomFont',
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 10,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: screenSize.width * 0.09),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Practice(data: 'Animal'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              screenSize.width * 0.4, screenSize.width * 0.4),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 161, 21),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/animal.png'),
                              width: 60,
                              height: 60,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Animal',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'MyCustomFont',
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 10,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Practice(data: 'Weather'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              screenSize.width * 0.4, screenSize.width * 0.4),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 161, 21),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/weather.png'),
                              width: 60,
                              height: 60,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Weather',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'MyCustomFont',
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 10,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: screenSize.width * 0.09),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Practice(data: 'Fruit'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              screenSize.width * 0.4, screenSize.width * 0.4),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 161, 21),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/fruit.png'),
                              width: 60,
                              height: 60,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Fruit',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'MyCustomFont',
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 10,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Practice(data: 'Body'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              screenSize.width * 0.4, screenSize.width * 0.4),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 161, 21),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/body.png'),
                              width: 60,
                              height: 60,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Body',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'MyCustomFont',
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 10,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: screenSize.width * 0.09),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Practice(data: 'Color'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              screenSize.width * 0.4, screenSize.width * 0.4),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 161, 21),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/color.png'),
                              width: 60,
                              height: 60,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Color',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'MyCustomFont',
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 10,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
