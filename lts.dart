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
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
      checkAnswer(lastWords);
    });
  }

  Future<void> _speakQuestion() async {
    if (mode.isNotEmpty) {
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
          containerColor =
              const Color.fromARGB(255, 175, 174, 174); // Reset color
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: 360,
                height: 250,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      mode[current],
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, size: 20),
                      onPressed: _speakQuestion,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (lastWords.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'You said: $lastWords',
                  style: const TextStyle(fontSize: 18),
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
            const SizedBox(height: 150),
            if (!speechEnabled)
              const Text(
                'Speech recognition not available.',
                style: TextStyle(color: Colors.red, fontSize: 18),
              )
            else
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 191, 89),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  icon: const Icon(Icons.mic, size: 72),
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
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
