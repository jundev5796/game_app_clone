import 'dart:ui';

import 'package:flutter/material.dart';

class GameAppScreen extends StatefulWidget {
  const GameAppScreen({super.key});

  @override
  State<GameAppScreen> createState() => _GameAppScreenState();
}

class _GameAppScreenState extends State<GameAppScreen> {
  final PageController _pageController = PageController(
    viewportFraction: 0.6,
  );

  int _currentPage = 0;

  void _onPageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Container(
              key: ValueKey(_currentPage),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/covers/${_currentPage + 1}.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          PageView.builder(
            onPageChanged: _onPageChanged,
            controller: _pageController,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(),
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 8),
                        )
                      ],
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
