import 'package:flutter/material.dart';
import 'package:news/constants/constant.dart';
import 'package:news/screens/signIn-options.dart';

class onBoardingButton extends StatelessWidget {
  const onBoardingButton({
    super.key,
    required this.currentIndex,
    required PageController? controller,
  }) : _controller = controller;

  final int currentIndex;
  final PageController? _controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 65,
              width: 200,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.red,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  if (currentIndex == onBoardingContent.length - 1) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const signinOptions()));
                  }
                  _controller?.nextPage(duration: const Duration(milliseconds: 01), curve: Curves.ease);
                },
                child: Text(
                  currentIndex == onBoardingContent.length - 1 ? "Next" : "Continue",
                  style: const TextStyle(
                    fontFamily: "MontM",
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
