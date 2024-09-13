import 'package:flutter/material.dart';
import 'lts.dart';

class Select extends StatelessWidget {
  const Select({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const Row(children: <Widget>[
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
              )
            ]),
            const SizedBox(
              height: 30,
            ),
            Row(children: <Widget>[
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const Lts(data: 'Food') // Pass the string here
                        ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(170, 170),
                  backgroundColor: Color.fromARGB(255, 0, 191, 89),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                          'assets/food.jpg'), // Replace with your image path
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
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const Lts(data: 'Animal') // Pass the string here
                        ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(170, 170),
                  backgroundColor: Color.fromARGB(255, 0, 191, 89),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                          'assets/animal.jpg'), // Replace with your image path
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
            ]),
            const SizedBox(
              height: 30,
            ),
            Row(children: <Widget>[
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const Lts(data: 'Weather') // Pass the string here
                        ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(170, 170),
                  backgroundColor: Color.fromARGB(255, 0, 191, 89),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                          'assets/weather.jpg'), // Replace with your image path
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
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const Lts(data: 'Fruit') // Pass the string here
                        ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(170, 170),
                  backgroundColor: Color.fromARGB(255, 0, 191, 89),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                          'assets/fruit.jpg'), // Replace with your image path
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
            ]),
          ],
        ));
  }
}
