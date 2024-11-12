import 'package:flutter/material.dart';
import 'package:simple_emoji_generator/emoji_list.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

//This function triggers the build process
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Emoji Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.notoColorEmojiTextTheme(),
      ),
      home: EmojiScreen(),
    );
  }
}

class EmojiScreen extends StatefulWidget {
  @override
  _EmojiScreenState createState() => _EmojiScreenState();
}

class _EmojiScreenState extends State<EmojiScreen> {
  String _currentEmoji = '😪';
  final Random _random = Random();

  void _generateRandomEmoji() {
    setState(() {
      int randomIndex = _random.nextInt(emojiList.length);
      _currentEmoji = emojiList[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Text(
            'Random Emoji Generator',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: -1.5,
              wordSpacing: 0.0,
            ),
          ),
        ),
        titleSpacing: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _currentEmoji,
              style: GoogleFonts.notoColorEmoji(fontSize: 200),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateRandomEmoji,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Generate',
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                    WidgetSpan(
                      child: SizedBox(width: 10),
                    ),
                    TextSpan(
                      text: 'Emoji',
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
