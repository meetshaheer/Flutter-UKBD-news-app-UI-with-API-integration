import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news/API/api-call.dart';
import 'package:news/constants/constant.dart';

class newsScreen extends StatefulWidget {
  const newsScreen({super.key});

  @override
  State<newsScreen> createState() => _newsScreenState();
}

class _newsScreenState extends State<newsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.adjust)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Stack(
              children: [
                Positioned(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.notification4),
                  ),
                ),
                const Positioned(
                  right: 13,
                  top: 12,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 3.5,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: getBusinessData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: businessData.length,
                        itemBuilder: (context, index) {
                          var data = businessData[index];
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(40)),
                              child: Container(
                                color: Colors.amber,
                                width: double.infinity,
                                height: 400,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color.fromARGB(255, 83, 83, 83),
                                              Color.fromARGB(255, 209, 209, 209),
                                            ],
                                          ),
                                        ),
                                        child: Image(
                                          height: double.infinity,
                                          fit: BoxFit.fitHeight,
                                          image: NetworkImage(
                                            data.urlToImage ?? "https://i.sstatic.net/y9DpT.jpg",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 20,
                                      right: 20,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                        child: Container(
                                          color: Colors.red,
                                          height: 50,
                                          width: 50,
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Iconsax.save_2,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20, right: 20, top: 280),
                                        child: SizedBox(
                                          child: Text(
                                            data.title ?? "",
                                            style:
                                                const TextStyle(fontFamily: "MontB", fontSize: 20, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
                return const CircularProgressIndicator();
              }),
        ],
      ),
    );
  }
}
