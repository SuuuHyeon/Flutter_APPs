import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // pageController 선언
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    // 2초마다 다음 페이지로 이동하도록 Timer.periodic 사용
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        // 현재 페이지 가져오기
        int? nextPage = pageController.page?.toInt();
        animateTOPage(nextPage, pageController);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [1, 2, 3]
            .map((number) => Image.asset(
                  'assets/img/couple$number.jpeg',
                  fit: BoxFit.cover,
                ))
            .toList(),
      ),
    );
  }
}

// 다음 페이지 이동 메서드
void animateTOPage(int? nextPage, PageController controller) {
  // 페이지 값 없을 때
  if (nextPage == null) {
    return;
  }

  // 첫 페이지와 마짐가 페이지 분기처리
  if (nextPage == 2) {
    nextPage = 0;
  } else {
    nextPage++;
  }
  controller.animateToPage(nextPage,
      duration: const Duration(milliseconds: 500), curve: Curves.ease);
}
