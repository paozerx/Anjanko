import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  int current = 0;
  late List<String> wordList;
  late SpeechToText speechToText;
  late FlutterTts flutterTts;
  bool speechEnabled = false;
  String lastWords = '';
  Color containerColor = const Color.fromARGB(255, 175, 174, 174);
  Timer? timer;
  int start = 0;
  int bestTime = 0;

  @override
  void initState() {
    super.initState();
    speechToText = SpeechToText();
    flutterTts = FlutterTts();
    _initSpeech();
    selectionWordList();
    loadBestTime();
    startTimer();
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
    wordList = [
      "Omelette",
      "Noodle",
      "Pickle",
      "Turkey",
      "Salad",
      "Elephant",
      "Rabbit",
      "Cat",
      "Eagle",
      "Frog",
      "Rainy",
      "Cyclone",
      "Cloudy",
      "Temperature",
      "Lightning",
      "Mango",
      "Orange",
      "Apricot",
      "Coconut",
      "Apple",
      "Black",
      "White",
      "Purple",
      "Pink",
      "Brown",
      "Gray",
      "Shoulder",
      "Knee",
      "Chest",
      "Forehead",
      "Eyelash",
      "Cheek"
    ];
    wordList.shuffle();
    wordList = wordList.sublist(0, 10);
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
    } else if (word.isNotEmpty) {
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

  void startTimer() {
    start = 0;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (current < wordList.length) {
        setState(() {
          start++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  Future<void> saveBestTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (bestTime == 0 || start < bestTime) {
      setState(() {
        bestTime = start;
      });
      await prefs.setInt('bestTime', bestTime);
    }
  }

  Future<void> loadBestTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.remove('bestTime');
    int savedBestTime = prefs.getInt('bestTime') ?? 0;
    setState(() {
      bestTime = savedBestTime;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (current < wordList.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Challenge",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: <Widget>[
                SizedBox(width: screenWidth * 0.05),
                Text(
                  'Best Time: ${formatTime(bestTime)}',
                  style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: screenWidth * 0.22),
                Text(
                  'Time: ${formatTime(start)}',
                  style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'You said:',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: Colors.white,
                  ),
                ),
              ),
            SizedBox(height: screenHeight * 0.05),
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
      saveBestTime();
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Challenge",
            style: TextStyle(
                fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Last Time: ${formatTime(start)}',
                style: TextStyle(
                    fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Your Best Time: ${formatTime(bestTime)}',
                style: TextStyle(
                    fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }
  }
}
