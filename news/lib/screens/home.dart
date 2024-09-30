import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
            padding: const EdgeInsets.all(30.0),
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
          SizedBox(
            child: ElevatedButton(onPressed: (){}, child: text),
          ),
        ],
      ),
    );
  }
}
