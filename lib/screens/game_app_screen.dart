import 'package:flutter/material.dart';

class GameAppScreen extends StatefulWidget {
  const GameAppScreen({super.key});

  @override
  State<GameAppScreen> createState() => _GameAppScreenState();
}

class _GameAppScreenState extends State<GameAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/covers/${index + 1}.jpg"),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
