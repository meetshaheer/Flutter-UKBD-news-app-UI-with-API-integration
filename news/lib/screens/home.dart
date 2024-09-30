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
          padding: const EdgeInsets.only(top: 40, left: 20),
          child: Row(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
