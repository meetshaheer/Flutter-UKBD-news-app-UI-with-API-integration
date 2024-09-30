import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news/API/api-call.dart';
import 'package:news/constants/constant.dart';
import 'package:news/models/news-api-model.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Container(
                  width: 200,
                  height: 50,
                  color: const Color.fromARGB(255, 255, 229, 227),
                  child: const Center(
                      child: Text(
                    "Top Business News",
                    style: TextStyle(
                      fontFamily: "MontM",
                      color: Colors.black,
                    ),
                  )),
                ),
              ),
            ),
            FutureBuilder(
                future: getBusinessData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: businessData.length,
                        itemBuilder: (context, index) {
                          var data = businessData[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NewWidget(data: data)));
                            },
                            child: Padding(
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
                                              style: const TextStyle(
                                                  fontFamily: "MontB", fontSize: 20, color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 30,
                                        left: 30,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          child: Container(
                                            width: 100,
                                            height: 30,
                                            color: Colors.amber,
                                            child: const Center(
                                              child: Text(
                                                "Business",
                                                style:
                                                    TextStyle(fontFamily: "MontR", fontSize: 15, color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return const CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.data,
  });

  final apiModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  child: SizedBox(
                    height: 500,
                    child: Image(
                      height: double.infinity,
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(data.urlToImage ?? "https://i.sstatic.net/y9DpT.jpg"),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromRGBO(0, 0, 0, 1),
                          Color.fromRGBO(255, 255, 255, 0),
                        ],
                      ),
                    ),
                    height: 500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 380),
                child: Positioned(
                  child: Text(
                    data.title ?? "",
                    style: const TextStyle(
                      fontFamily: "MontB",
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 130,
                left: 30,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    width: 100,
                    height: 30,
                    color: Colors.amber,
                    child: const Center(
                      child: Text(
                        "Business",
                        style: TextStyle(fontFamily: "MontR", fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
