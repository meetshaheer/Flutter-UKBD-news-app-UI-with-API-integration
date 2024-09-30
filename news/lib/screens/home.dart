import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class homeView extends StatefulWidget {
  const homeView({super.key});

  @override
  State<homeView> createState() => _homeViewState();
}

class _homeViewState extends State<homeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 70,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 234, 234, 234),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_left)),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    fontFamily: "MontR",
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: double.infinity,
                height: 450,
                child: Stack(
                  children: [
                    Positioned(
                      child: Image.asset(
                        "assets/mainImage.png",
                        fit: BoxFit.cover,
                        height: 600,
                      ),
                    ),
                    const Positioned(
                      bottom: 50,
                      left: 20,
                      child: Text(
                        "Sign In \nOptions.",
                        style: TextStyle(
                          fontFamily: "MontB",
                          color: Colors.white,
                          fontSize: 40,
                          height: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30),
            child: customButton(
              text: "Continue with Email",
              buttonColor: Colors.red,
              textCOlor: Colors.white,
              iconname: Iconsax.direct,
              iconColor: Colors.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 30.0, right: 30),
            child: customButton(
              text: "Sign In with Google",
              buttonColor: Color(0xffEAE9F1),
              textCOlor: Colors.black,
              iconname: Icons.snapchat_sharp,
              iconColor: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 30.0, right: 30),
            child: customButton(
              text: "Continue with Email",
              buttonColor: Colors.red,
              textCOlor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class customButton extends StatelessWidget {
  const customButton({
    super.key,
    required this.text,
    this.iconname,
    required this.buttonColor,
    required this.textCOlor,
    this.iconColor,
  });

  final String text;
  final IconData? iconname;
  final Color buttonColor;
  final Color textCOlor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(buttonColor),
        ),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconname,
              color: iconColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: "MontM",
                fontSize: 13,
                color: textCOlor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
