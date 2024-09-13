import 'package:flutter/material.dart';
import 'lts.dart';

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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            const Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Select Mode",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: screenSize.width * 0.05,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Lts(data: 'Food'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(screenSize.width * 0.4, screenSize.width * 0.4),
                    backgroundColor: const Color.fromARGB(255, 0, 191, 89),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/food.jpg'),
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Food',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.09,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Lts(data: 'Animal'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(screenSize.width * 0.4, screenSize.width * 0.4),
                    backgroundColor: const Color.fromARGB(255, 0, 191, 89),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/animal.jpg'),
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Animal',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
              children: <Widget>[
                SizedBox(
                  width: screenSize.width * 0.05,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Lts(data: 'Weather'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(screenSize.width * 0.4, screenSize.width * 0.4),
                    backgroundColor: const Color.fromARGB(255, 0, 191, 89),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/weather.jpg'),
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Weather',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.09,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Lts(data: 'Fruit'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(screenSize.width * 0.4, screenSize.width * 0.4),
                    backgroundColor: const Color.fromARGB(255, 0, 191, 89),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/fruit.jpg'),
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Fruit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
              children: <Widget>[
                SizedBox(
                  width: screenSize.width * 0.05,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Lts(data: 'Body'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(screenSize.width * 0.4, screenSize.width * 0.4),
                    backgroundColor: const Color.fromARGB(255, 0, 191, 89),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/body.jpg'),
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Body',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.09,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Lts(data: 'Color'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(screenSize.width * 0.4, screenSize.width * 0.4),
                    backgroundColor: const Color.fromARGB(255, 0, 191, 89),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
    );
  }
}
