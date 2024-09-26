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
  late List<String> wordList;
  late SpeechToText speechToText;
  late FlutterTts flutterTts;
  bool speechEnabled = false;
  String lastWords = '';
  Color containerColor = const Color.fromARGB(255, 175, 174, 174);

  @override
  void initState() {
    super.initState();
    speechToText = SpeechToText();
    flutterTts = FlutterTts();
    _initSpeech();
    selectionWordList();
  }

  Future<void> _initSpeech() async {
    speechEnabled = await speechToText.initialize();
    setState(() {});
  }

  void startListening() async {
    if (speechEnabled) {
      await speechToText.listen(
        onResult: onSpeechResult,
        localeId: 'en_US',
      );
      setState(() {});
    }
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
      checkAnswer(lastWords);
    });
  }

  Future<void> speaks() async {
    if (wordList.isNotEmpty) {
      await flutterTts.setLanguage('en-US');
      await flutterTts.speak(wordList[current]);
    }
  }

  void selectionWordList() {
    switch (widget.data) {
      case "Food":
        wordList = ["Omelette", "Noodle", "Pickle", "Turkey", "Salad"];
        wordList.shuffle();
        break;
      case "Animal":
        wordList = ["Elephant", "Rabbit", "Cat", "Eagle", "Frog"];
        wordList.shuffle();
        break;
      case "Weather":
        wordList = ["Rainy", "Cyclone", "Cloudy", "Temperature", "Lightning"];
        wordList.shuffle();
        break;
      case "Fruit":
        wordList = ["Mango", "Orange", "Apricot", "Coconut", "Apple"];
        wordList.shuffle();
        break;
      case "Color":
        wordList = ["Black", "White", "Purple", "Pink", "Brown", "Gray"];
        wordList.shuffle();
        break;
      case "Body":
        wordList = [
          "Shoulder",
          "Knee",
          "Chest",
          "Forehead",
          "Eyelash",
          "Cheek"
        ];
        wordList.shuffle();
        break;
      default:
        wordList = [];
    }
  }

  void checkAnswer(String word) {
    if (word.toLowerCase() == wordList[current].toLowerCase()) {
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
    } else if (word.toLowerCase() != wordList[current].toLowerCase() &&
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

    if (current < wordList.length) {
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
                      wordList[current],
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
            if (!speechEnabled)
              const Text(
                'Speech recognition not available.',
                style: TextStyle(color: Colors.red, fontSize: 18),
              )
            else
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 161, 21),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  icon: Icon(Icons.mic, size: screenWidth * 0.15),
                  onPressed: startListening,
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
