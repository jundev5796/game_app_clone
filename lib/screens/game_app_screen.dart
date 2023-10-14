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

  List<GameInfo> games = [
    GameInfo(
      title: "Resident Evil 4",
      description:
          "Resident Evil 4, 2005’s legendary survival horror, is brought fully up-to-date in this ground-up remake. Experience the horror once again with Leon.",
      rating: 4.7,
      imagePath: "assets/covers/1.jpg",
    ),
    GameInfo(
      title: "God of War: Ragnarok",
      description:
          "The freezing winds of Fimbulwinter have come to Midgard, making survival for Kratos, Atreus, and Mimir in the Norse wilds even more challenging than before.",
      rating: 4.8,
      imagePath: "assets/covers/2.jpg",
    ),
    GameInfo(
      title: "Ys X: Nordics",
      description:
          "Ys X: Nordics is a brand-new adventure set in the northern sea Obelia Bay, featuring young adventurer Adol Christin as the protagonist.",
      rating: 4.9,
      imagePath: "assets/covers/3.jpg",
    ),
    GameInfo(
      title: "Crisis Core: FF VII Reunion",
      description:
          "CRISIS CORE -FINAL FANTASY VII- REUNION is a full remaster of the PlayStation Portable exclusive CRISIS CORE -FINAL FANTASY VII-, which originally launched back in 2007.",
      rating: 4.3,
      imagePath: "assets/covers/4.jpg",
    ),
    GameInfo(
      title: "Lies of P",
      description:
          "You wake up at an abandoned train station in Krat, a city overwhelmed by madness and bloodlust. Explore the world of Krat with Pinocchio to find the truth.",
      rating: 4.5,
      imagePath: "assets/covers/5.jpg",
    ),
  ];

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
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    games[index].title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    games[index].description,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class GameInfo {
  final String title;
  final String description;
  final double rating;
  final String imagePath;

  GameInfo({
    required this.title,
    required this.description,
    required this.rating,
    required this.imagePath,
  });
}
