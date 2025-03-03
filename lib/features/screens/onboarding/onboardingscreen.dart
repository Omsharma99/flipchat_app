import 'package:flutter/material.dart';
import '../../authentication/create_account.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  List<String> onboardingImages = [
    'assets/images/pic1-removebg-preview.png',
    'assets/images/pic2-removebg-preview.png',
    'assets/images/pic3-removebg-preview.png',
    'assets/images/pic4-removebg-preview.png',
  ];

  List<String> titles = [
    "Discover Connections",
    "Meeting New People",
    "Connect with Matches",
    "Engage and Connect"
  ];

  List<String> subtitles = [
    "Where Your Story Begins.",
    "in Your Area",
    "Ideal Matches",
    "Chat and Call"
  ];

  List<String> descriptions = [
    "Find your perfect match and start chatting today!",
    "Discover and connect with new people around you effortlessly!",
    "Stay connected with your matches and keep conversations flowing!",
    "Make meaningful connections through seamless chats and calls!"
  ];

  void _nextPage() {
    if (_currentPage < 3) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      // Navigate to CreateAccountScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CreateAccountScreen()),
      );
    }
  }

  void _skip() {
    // Navigate to CreateAccountScreen immediately
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CreateAccountScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: 4,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      onboardingImages[index],
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.9,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      titles[index],
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink),
                    ),
                    Text(
                      subtitles[index],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        descriptions[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: _currentPage == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.pink : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _skip,
                  child: const Text("Skip",
                      style: TextStyle(color: Colors.pink, fontSize: 16)),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.pink,
                  onPressed: _nextPage,
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
