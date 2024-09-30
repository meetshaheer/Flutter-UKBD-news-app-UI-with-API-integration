
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news/models/news-api-model.dart';

class detailNewPage extends StatelessWidget {
  const detailNewPage({
    super.key,
    required this.data,
  });

  final apiModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  bottom: 150,
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
                ),
                Positioned(
                  bottom: 150,
                  left: 150,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      width: 120,
                      height: 30,
                      color: const Color.fromARGB(255, 137, 131, 131),
                      child: Center(
                        child: Text(
                          data.publishedAt?.substring(0, 10) ?? "Monday",
                          style: const TextStyle(fontFamily: "MontR", fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Iconsax.arrow_left,
                          color: Colors.white,
                        )),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 20,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.share,
                          color: Colors.white,
                        )),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 70,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.save_2,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage("https://cdn.icon-icons.com/icons2/70/PNG/512/bbc_news_14062.png"),
                    ),
                    title: const Text(
                      "BBC News",
                      style: TextStyle(fontFamily: "MontB", fontSize: 15),
                    ),
                    subtitle: const Text(
                      "@bbc",
                      style: TextStyle(fontFamily: "MontM", fontSize: 12),
                    ),
                    trailing: SizedBox(
                        height: 45,
                        width: 110,
                        child: ElevatedButton(
                            style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
                            onPressed: () {},
                            child: const Text(
                              "+ Follow",
                              style: TextStyle(color: Colors.white),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      data.content ?? "",
                      style: const TextStyle(fontFamily: "MontM"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      data.description ?? "",
                      style: const TextStyle(fontFamily: "MontM"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            child: Container(
                              width: 200,
                              height: 50,
                              color: const Color.fromARGB(255, 255, 229, 227),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, top: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Written By: ",
                                      style: TextStyle(
                                        fontFamily: "MontB",
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      data.author ?? "",
                                      style: const TextStyle(
                                        fontFamily: "MontM",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            child: Container(
                              width: 200,
                              height: 50,
                              color: const Color.fromARGB(255, 255, 241, 205),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, top: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Written At: ",
                                      style: TextStyle(
                                        fontFamily: "MontB",
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "${data.publishedAt?.substring(0, 10)} ${data.publishedAt?.substring(11, 19)}" ??
                                          "",
                                      style: const TextStyle(
                                        fontFamily: "MontM",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
