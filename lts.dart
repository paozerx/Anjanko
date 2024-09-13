import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Lts extends StatefulWidget {
  final String data;
  const Lts({super.key, required this.data});

  @override
  State<Lts> createState() => _LtsState();
}

class _LtsState extends State<Lts> {
  int current = 0;
  late List<String> mode;
  late SpeechToText _speechToText;
  late FlutterTts _flutterTts;
  bool speechEnabled = false;
  String lastWords = '';
  Color containerColor = const Color.fromARGB(255, 175, 174, 174);

  @override
  void initState() {
    super.initState();
    _speechToText = SpeechToText();
    _flutterTts = FlutterTts();
    _initSpeech();
    selectionMode();
  }

  Future<void> _initSpeech() async {
    speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    if (speechEnabled) {
      await _speechToText.listen(
        onResult: _onSpeechResult,
        localeId: 'en_US',
      );
      setState(() {});
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
      checkAnswer(lastWords);
    });
  }

  Future<void> speaks() async {
    if (mode.isNotEmpty) {
      await _flutterTts.setLanguage('en-US');
      await _flutterTts.speak(mode[current]);
    }
  }

  void selectionMode() {
    switch (widget.data) {
      case "Food":
        mode = ["Omelette", "Noodle", "Pickle", "Turkey", "Salad"];
        mode.shuffle();
        break;
      case "Animal":
        mode = ["Elephant", "Rabbit", "Cat", "Eagle", "Frog"];
        mode.shuffle();
        break;
      case "Weather":
        mode = ["Rainy", "Cyclone", "Cloudy", "Temperature", "Lightning"];
        mode.shuffle();
        break;
      case "Fruit":
        mode = ["Mango", "Orange", "Apricot", "Coconut", "Apple"];
        mode.shuffle();
        break;
      case "Color":
        mode = ["Black", "White", "Purple", "Pink", "Brown", "Gray"];
        mode.shuffle();
        break;
      case "Body":
        mode = ["Shoulder", "Knee", "Chest", "Forehead", "Eyelash", "Cheek"];
        mode.shuffle();
        break;
      default:
        mode = [];
    }
  }

  void checkAnswer(String word) {
    if (word.toLowerCase() == mode[current].toLowerCase()) {
      setState(() {
        containerColor = Colors.green;
      });
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          containerColor = const Color.fromARGB(255, 175, 174, 174);
          current++;
          lastWords = '';
        });
      });
    } else if (word.toLowerCase() != mode[current].toLowerCase() &&
        word.isNotEmpty) {
      setState(() {
        containerColor = Colors.red;
      });
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          containerColor = const Color.fromARGB(255, 175, 174, 174);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (current < mode.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.data,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.3,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      mode[current],
                      style: TextStyle(
                          fontSize: screenWidth * 0.08,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.volume_up_rounded,
                          size: screenWidth * 0.08),
                      onPressed: speaks,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            if (lastWords.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'You said: $lastWords',
                  style: TextStyle(fontSize: screenWidth * 0.05),
                ),
              ),
            if (lastWords.isEmpty)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  ' ',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            SizedBox(height: screenHeight * 0.2),
            if (!speechEnabled)
              const Text(
                'Speech recognition not available.',
                style: TextStyle(color: Colors.red, fontSize: 18),
              )
            else
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 159, 130, 151),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  icon: Icon(Icons.mic, size: screenWidth * 0.15),
                  onPressed: _startListening,
                ),
              ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.data,
            style: TextStyle(
                fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'You have completed.',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }
}
