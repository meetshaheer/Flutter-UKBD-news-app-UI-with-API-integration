import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/constants/constant.dart';
import 'package:news/screen-contents/onboarding-buttons.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.black),
        ),
      ),
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: onBoardingContent.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(255, 35, 35, 35),
                        Color.fromARGB(255, 124, 124, 124),
                      ],
                    ),
                  ),
                  child: SvgPicture.asset(
                    onBoardingContent[index][2],
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        onBoardingContent[index][0],
                        style: const TextStyle(
                          fontFamily: "MontB",
                          color: Colors.white,
                          fontSize: 45,
                          height: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        onBoardingContent[index][1],
                        style: const TextStyle(
                          fontFamily: "MontB",
                          color: Colors.red,
                          fontSize: 45,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onBoardingButton(currentIndex: currentIndex, controller: _controller)
            ],
          );
        },
      ),
    );
  }
}
